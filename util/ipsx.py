#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
###############################################################################
##                                                                           ##
##   ########## ####### ######### ##########  ####### ######### ##########   ##
##   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   ##
##   ###          ###      ###    ###     ###   ###      ###    ###          ##
##   ###          ###      ###    #########     ###      ###    #######      ##
##   ###          ###      ###    ###   ###     ###      ###    ###          ##
##   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   ##
##   ########## #######    ###    ###     ### #######    ###    ##########   ##
##                                                                           ##
##                       HACK: Pokémon Citrite Version                       ##
##                           OFFICIAL  Source Code                           ##
##                                                                           ##
##                  Copyright © 2014-2016 Alexander Nicholi                  ##
##                           All rights  reserved.                           ##
##                                                                           ##
###############################################################################
from sys import argv, exit
from os import path
class Msg:
    ModeAlreadySet = 'Mode already set'
    ModeNotSet     = 'Mode not set'
    UnknownOpt     = 'Unknown option provided'
    BadArgCount    = 'Bad number of arguments provided'
class Header:
    msbSentinel = 0x85
    humanMarker = 'IPS'
    version     = 1
    dosEOL      = '\r\n'
    dosFakeEOF  = 0x1A
    unixEOL     = '\n'
    
    def getBytes(self):
        humanMarker = bytearray()
        humanMarker.extend(map(ord, self.humanMarker))
        dosEOL = bytearray()
        dosEOL.extend(map(ord, self.dosEOL))
        unixEOL = bytearray()
        unixEOL.extend(map(ord, self.unixEOL))
        return bytearray([self.msbSentinel]) + humanMarker + bytearray([self.version]) + dosEOL + bytearray([self.dosFakeEOF]) + unixEOL

class Record:
    ## Normal record structure
    # Offset  | uint    | 6 bytes  | Offset beginning changes
    # Size    | int     | 2 bytes  | Size of payload in bytes (positive)
    # Payload | ubyte[] | (varies) | Array of changed bytes
    #
    ## RLE record structure
    # Offset  | uint  | 6 bytes | Offset beginning changes
    # Size    | int   | 2 bytes | Size of payload in bytes (negative)
    # Payload | ubyte | 1 byte  | Changed byte
    #
    # An offset limit of 2^48 allows for binary sizes up to 256TiB (tebibytes)
    # A negative size value signifies that the record is an RLE record. If a
    # record is RLE, it can only expand into an array of a single byte value.
    
    def __init__(self, offset, size, payload):
        if offset >= pow(2, 48) - 1:
            raise Exception('Record offset too far. Aborting…')
        if offset < 0:
            raise Exception('Record offset cannot be negative. Aborting…')
        if size >= 32768 or size <= -32768:
            raise Exception('Record size too large. Aborting…')
        self.mode = 'normal'
        # is this record RLE?
        if size < 0:
            self.mode = 'rle'
        if self.mode == 'normal':
            if type(payload) is not list:
                raise Exception('Normal record payload is not a list. Aborting…')
            for byte in payload:
                if byte >= 256:
                    raise Exception('One of the members of the payload list is not byte-size. Aborting…')
                if byte < 0:
                    raise Exception('One of the members of the payload list is negative. Aborting…')
        elif self.mode == 'rle':
            if type(payload) is not int:
                raise Exception('RLE record payload is not an integer. Aborting…')
            if payload >= 256:
                raise Exception('The payload value is not byte-size. Aborting…')
            if payload < 0:
                raise Exception('The payload value cannot be negative. Aborting…')
        # put the rest into the object
        self.payload = payload
        self.size    = size
        self.offset  = offset
    
    def getBytes(self):
        from struct import pack
        out = pack('<Q', self.offset)[:6]
        out += pack('<h', self.size)
        if self.mode == 'rle':
            out += pack('<B', self.payload)
        else:
            out += bytes(self.payload)
            
        return out

class Patch:
    records = []
    
    def addRecord(self, offset, size, payload, rle = False):
        if rle:
            self.records += [Record(offset, size * -1, payload[0])]
        else:
            self.records += [Record(offset, size, payload)]
        
    
    def delRecord(self, offset):
        i        = 0
        recordct = len(self.records)
        while(i < recordct):
            if self.records[i].offset == offset:
                del self.records[i]
            else:
                i += 1

def Error(input):
    from sys import stderr
    from os import linesep
    stderr.write('ERROR: ' + input + linesep)

def getFileBytes(filename):
    ret = []
    with open(filename, 'rb') as f:
        raw = f.read(path.getsize(filename))
        for b in raw:
            ret += [b]
    return ret

def createPatch(orig, modi, rle):
    print('Firing up the patch creation system.')
    header  = Header()
    patch   = Patch()
    i       = 0
    modilen = len(modi)
    origlen = len(orig)
    if modilen < origlen:
        raise Exception('Modified file cannot be smaller than original. Aborting…')
    changes = []
    offsets = []
    rleflag = []
    curch   = []
    curoffs = 0
    recsize = 0
    # tokenise all of the changes and their offsets
    print('Tokenising changes and their offsets… ')
    while i < origlen:
        if recsize >= 32767:
            # we’ve reached the maximum record size, flush regardless
            changes += [curch]
            offsets += [curoffs + 1]
            rleflag += [False]
            curch = []
            curoffs = i
            recsize = 0
        elif orig[i] != modi[i]:
            # a byte differs! record it
            curch += [modi[i]]
            recsize += 1
        elif curch != []:
            # no match, and we have data to flush
            changes += [curch]
            offsets += [curoffs + 1]
            rleflag += [False]
            curch = []
            curoffs = i
            recsize = 0
        else:
            # no match now or earlier
            curoffs = i
            recsize = 0
        i += 1
    if modilen > origlen:
        # record all of the new changes
        # NOTE: if the last in-bounds byte in orig was different, this will
        # continue rolling the same record. no redundancy :)
        while i < modilen:
            if recsize >= 32767:
                changes += [curch]
                offsets += [curoffs + 1]
                rleflag += [False]
                curch = []
                curoffs = i
                recsize = 0
            else:
                curch   += [modi[i]]
                recsize += 1
            i += 1
        # flush the last change record
        if curch != []:
            changes += [curch]
            offsets += [curoffs]
            rleflag += [False]
            curoffs  = i
    print('done.')
    # if we’re allowed to do RLE:
    # sort through changes, and cut out new same-byte record spans to be RLE’d
    # to get its own record the span must contain 8 or more of the same byte
    changect = len(changes)
    if rle:
        print('RLE compression is ON. Sifting through records’ contents for repeats… ')
        i        = 0
        # go through each record
        while i < changect:
            i2        = 0
            repeatct  = 1
            recordlen = len(changes[i])
            curbyte   = changes[i][0]
            foundend  = False
            counting  = False
            # prevent neverending loops
            if rleflag[i] == True:
                i += 1
                continue
            while i2 < recordlen:
                if i2 == recordlen - 1 and foundend == False:
                    i2 -= 1
                    foundend  = True
                    counting  = False
                    repeatct += 1
                elif curbyte == changes[i][i2]:
                    if counting:
                        repeatct += 1
                    counting  = True
                else:
                    counting = False
                    curbyte  = changes[i][i2]
                    repeatct = 1
                # do we have something worth RLE’ing?
                if repeatct >= 8 and counting == False:
                    i3 = 0
                    # remove all of the repeated bytes from the old record
                    while i3 < repeatct - 1:
                        del changes[i][i2 - repeatct]
                        i3 += 1
                    i3 = 0
                    # split off the first half of the old record
                    firsthalf = []
                    while i3 < i2 - repeatct:
                        firsthalf += [changes[i][i3]]
                        i3 += 1
                    i3 = i2 + repeatct
                    # split off the second half of the old record
                    secondhalf = []
                    while i3 < recordlen:
                        secondhalf += [changes[i][i2 + repeatct]]
                        del changes[i][i2 + repeatct]
                        i3 += 1
                    # rearrange the changes list proper, and
                    # splice in a new offset and RLE flag
                    if firsthalf != []:
                        if secondhalf != []:
                            changes = changes[:i] + [firsthalf] + changes[i] + [secondhalf] + changes[i + 1:]
                            offsets = offsets[:i] + [offsets[i]] + [offsets[i] + i2] + [offsets[i] + i2 + repeatct] + offsets[i + 1:]
                            rleflag = rleflag[:i] + [False, True, False] + rleflag[i + 1:]
                        else:
                            changes = changes[:i] + [firsthalf] + changes[i:]
                            offsets = offsets[:i] + [offsets[i]] + [offsets[i] + i2] + offsets[i + 1:]
                            rleflag = rleflag[:i] + [False, True] + rleflag[i + 1:]
                    else:
                        if secondhalf != []:
                            changes = changes[:i + 1] + [secondhalf] + changes[i + 1:]
                            offsets = offsets[:i + 1] + [offsets[i] + i2] + [offsets[i] + i2 + repeatct] + offsets[i + 1:]
                            rleflag = rleflag[:i] + [True, False] + rleflag[i + 1:]
                        else:
                            rleflag = rleflag[:i] + [True] + rleflag[i + 1:]
                    break
                # keep going through the current record
                i2 += 1
            i += 1
        print('done.')
    else:
        print('RLE compression is OFF. Skipping removal of repeated sequences.')
    i        = 0
    # load our scattered data into the Patch object
    print('Loading raw data into the record system… ')
    while i < changect:
        if changes[i] != []:
            size = len(changes[i])
            patch.addRecord(offsets[i], size, changes[i], rleflag[i])
        i += 1
    print('done.')
    i = 0
    #
    # Generate the binary file from the Patch object
    #
    print('Generating the patch file… ')
    recordct = len(patch.records)
    patchbin = header.getBytes()
    while i < recordct:
        patchbin += patch.records[i].getBytes()
        i += 1
    patchbin += b'\xFF\xFF\xFF\xFF\xFF\xFF'
    print('done.')
    return patchbin

def applyPatch(binary, patch):
    print('Firing up the patch applyment utility.')
    from struct import unpack
    # verify the integrity of the header
    if(bytes(patch[:4]) != b'\x85IPS' or bytes(patch[5:9]) != b'\r\n\x1A\n'):
        raise Exception('Did not find a valid IPSX header. Either this is not an IPSX patch, or your patch has been corrupted and is not recoverable.')
    # ensure we have a compatible patch version
    if(patch[4] != 1):
        print('WARNING: The version specified in the patch’s header is not supported by this utility. PROCEED WITH CAUTION.')
    # parse patch file into an object of records
    print('Parsing patch records… ')
    i        = 9
    patchlen = len(patch)
    offsets  = []
    sizes    = []
    rlemarks = []
    payloads = []
    while i < patchlen:
        rcuroffs = []
        while len(rcuroffs) < 6:
            rcuroffs += [patch[i]]
            i += 1
        offsets += [unpack('<Q', bytes(rcuroffs) + b'\x00\x00')[0]]
        if offsets[-1] >= 0xFFFFFFFFFFFF:
            # end of records marker reached
            offsets = offsets[:-1]
            break
        rcursize = []
        while len(rcursize) < 2:
            rcursize += [patch[i]]
            i += 1
        sizes   += [unpack('<h', bytes(rcursize))[0]]
        if sizes[-1] < 0:
            sizes[-1] *= -1
            rlemarks  += [True]
        else:
            rlemarks += [False]
        rcurpayl = []
        while len(rcurpayl) < sizes[-1] and i < patchlen:
            rcurpayl += [patch[i]]
            if not rlemarks[-1]:
                i += 1
        if rlemarks[-1]:
            i += 1
        payloads += [bytes(rcurpayl)]
    recordct = len(offsets)
    print('done.')
    i = 0
    print('Writing records to ROM… ')
    while i < recordct:
        i2 = 0
        if offsets[i] >= len(binary):
            binary += payloads[i]
        else:
            while i2 < sizes[i]:
                binary[offsets[i] + i2] = payloads[i][i2]
                i2 += 1
        i += 1
    print('done.')
    return bytes(binary)

def main():
    opts  = []
    files = []
    i     = 0
    for arg in argv:
        if i == 0:
            i += 1
            continue
        if arg.startswith('-'):
            opts += [arg]
        else:
            files += [arg]
        i += 1
    if opts == []:
        opts = ['-h']
    if '-h' in opts or '--help' in opts:
        print('')
        print('Usage:')
        print('  $ ipsx.py -c <ORIGINAL> <MODIFIED> <PATCH>')
        print('    Creates an IPSX patch from ORIGINAL and MODIFIED, saved to PATCH.')
        print('  $ ipsx.py -a <FILE> <PATCH>')
        print('    Applies IPSX patch file PATCH to FILE.')
        print('  $ ipsx.py -i <PATCH>')
        print('    Prints metainformation about IPSX patch file PATCH.')
        print('  $ ipsx.py -h')
        print('    Prints this message.')
        print('  $ ipsx.py -u ...')
        print('    Forces patch creation to work without RLE compression. Only useful')
        print('    in tandem with the -c flag; patches have a sentinel for RLE.')
        print('')
        exit(0)
    mode = None
    rle  = True
    for opt in opts:
        if opt == '-c':
            if mode != None:
                Error(Msg.ModeAlreadySet)
                exit(1)
            mode = 'create'
        elif opt == '-a':
            if mode != None:
                Error(Msg.ModeAlreadySet)
                exit(1)
            mode = 'apply'
        elif opt == '-i':
            if mode != None:
                Error(Msg.ModeAlreadySet)
                exit(1)
            mode = 'info'
        elif opt == '-u':
            rle = False
        elif opt == '-uc' or opt == '-cu':
            if mode != None:
                Error(Msg.ModeAlreadySet)
                exit(1)
            mode = 'create'
            rle = False
        else:
            Error(Msg.UnknownOpt)
            exit(2)
    if mode == None:
        Error(Msg.ModeNotSet)
        exit(3)
    filect = len(files)
    if mode == 'create':
        print('Creation of a patch requested.')
        if filect != 3:
            Error(Msg.BadArgCount)
            exit(4)
        print('Reading binary files from disk… ')
        orig = getFileBytes(files[0])
        print('… ')
        modi = getFileBytes(files[1])
        print('done.')
        ptch = createPatch(orig, modi, rle)
        print('Writing patch data to file… ')
        open(files[2], 'wb').write(ptch)
        print('done.')
    elif mode == 'apply':
        print('Application of a patch requested.')
        if filect != 2:
            Error(Msg.BadArgCount)
            exit(4)
        print('Reading binary files from disk… ')
        binary = getFileBytes(files[0])
        print('… ')
        patch  = getFileBytes(files[1])
        print('done.')
        modif  = applyPatch(binary, patch)
        print('Writing modified binary to file… ')
        open(files[0], 'wb').write(modif)
        print('done.')

if __name__ == '__main__':
    main()
