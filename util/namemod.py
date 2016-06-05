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
##                          Pokémon Citrite Version                          ##
##                              OFFICIAL Source                              ##
##                                                                           ##
##                  Copyright © 2014-2016 Alexander Nicholi                  ##
##                            All rights reserved                            ##
##                                                                           ##
###############################################################################
from sys import argv, exit, stderr
from os  import sep
class Msg:
    UnknownOpt    = 'Unknown option provided'
    TooManyInputs = 'Too many inputs provided. Give only one (1)'
    NoInputs      = 'No inputs provided. Give only one (1)'
def Error(input):
    from sys import stderr
    from os import linesep
    stderr.write('ERROR: ' + input + linesep)
def main():
    manglechar = '+'
    opts       = []
    files      = []
    i          = 0
    for arg in argv:
        if i == 0:
            i += 1
            continue
        if arg.startswith('-'):
            opts += [arg]
        else:
            files += [arg]
        i += 1
    mode   = None
    mangle = False
    for opt in opts:
        if opt == '-m' or opt == '--mangle':
            mangle = True
        elif opt == '-ml' or opt == '-lm':
            mangle = True
            mode   = 'last'
        elif opt == '-ma' or opt == '-am':
            mangle = True
            mode   = 'all'
        elif opt == '-me' or opt == '-em':
            mangle = True
            mode   = 'extra'
        elif opt == '-l' or opt == '--last':
            mode = 'last'
        elif opt == '-a' or opt == '--all':
            mode = 'all'
        elif opt == '-e' or opt == '--extra':
            mode = 'extra'
        elif opt == '-h' or opt == '--help':
            print('')
            print('Usage:')
            print('    ')
            print('  $ namemod.py -l <filename>')
            print('    Splits the last extension off of the filename.')
            print('  $ namemod.py -a <filename>')
            print('    Splits all extensions off of the filename. If no mode is explicitly')
            print('    set, this mode is assumed.')
            print('  $ namemod.py -e <filename>')
            print('    Removes all extensions other than the last one.')
            print('  $ namemod.py -m <filename>')
            print('    Mangles directory names in the filename. May be used in conjunction')
            print('    with the -a, -l, or -e flags. If not set, directories are stripped')
            print('    from the filename entirely.')
            print('  $ namemod.py -h')
            print('    Prints this message and exits.')
            print('')
            exit(0)
        else:
            Error(Msg.UnknownOpt)
            exit(2)
    if mode == None:
        mode = 'all'
    filect = len(files)
    if filect > 1:
        Error(Msg.TooManyInputs)
        exit(3)
    if filect < 1:
        Error(Msg.NoInputs)
        exit(4)
    if files[0].startswith('.' + sep):
        files[0] = files[0][2:]
    if mode == 'last':
        from os import path
        if mangle:
            print(path.splitext(files[0])[0].replace(sep, manglechar))
        else:
            print(path.splitext(path.basename(files[0]))[0])
    elif mode == 'all':
        from os import path
        if mangle:
            dirs     = sep.join(files[0].split(sep)[:-1])
            fname    = path.basename(files[0]).split('.')[0]
            adjusted = fname
            if dirs != '':
                adjusted = dirs + sep + adjusted
            print(adjusted.replace(sep, manglechar))
        else:
            print(path.basename(files[0]).split('.')[0])
    else: # mode == 'extra'
        from os import path
        if mangle:
            dirs     = sep.join(files[0].split(sep)[:-1])
            splits   = path.basename(files[0]).split('.')
            adjusted = splits[0] + '.' + splits[-1]
            if dirs != '':
                adjusted = dirs + sep + adjusted
            print(adjusted.replace(sep, manglechar))
        else:
            splits = path.basename(files[0]).split('.')
            print(splits[0] + '.' + splits[-1])

if __name__ == '__main__':
    main()
