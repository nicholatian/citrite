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
from sys import argv, exit, stderr
from os import linesep
def run(command):
    import subprocess
    try:
        return subprocess.check_output(command).decode()
    except subprocess.CalledProcessError as e:
        print(e.output.decode(), file=stderr)
        exit(1)
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
for objfile in files:
    unsyms  = []
    regsyms = []
    nmout  = run(['arm-none-eabi-nm', '-nPS', objfile]).split(linesep)
    for lnum, line in enumerate(nmout):
        # ignore empty lines and lines only containing whitespace
        if line == '':
            continue
        nonblank = True
        for char in line:
            if char != ' ' and char != '\t':
                blank = False
                break
        if blank:
            continue
        # split the line into parts
        parts = line.split(' ')
        # remove blank parts
        i = 0
        while i < len(parts):
            if parts[i] == '':
                parts = parts[:i] + parts[i + 1:]
            i += 1
        count = len(parts)
        # ensure it’s within normal bounds
        if count < 2:
            raise Exception('Strange number of items on line ' + str(lnum + 1) + ' of arm-none-eabi-nm’s output: `' + str(parts) + '`')
        # finally, check for a match
        if parts[1] == 'U':
            unsyms += [parts[0]]
        else:
            regsyms += [parts[0]]
    args = ['-s']
    for symbol in unsyms:
        args += ['-N', symbol]
    for symbol in regsyms:
        args += ['-K', symbol]
    print(run(['arm-none-eabi-strip'] + args + [objfile]))
