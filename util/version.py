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
if '--help' in argv or '-h' in argv:
    print('Usage:')
    print('    ')
    print('  $ util/version.py major|minor|patch')
    print('')
    print('After the operation, the new version number will be printed to stdout.')
    print('')
    exit(0)
argc = len(argv)
curver = open('version', 'r').read().replace('\n', '').replace('\r', '')
if argc == 1:
    print(curver)
elif argc == 2:
    nums = curver.split('.')
    if len(nums) != 3:
        raise Exception('Bad number of parts in the version number file.')
    major = int(nums[0])
    minor = int(nums[1])
    patch = int(nums[2])
    if argv[1] == 'major':
        major += 1
        minor  = 0
        patch  = 0
    elif argv[1] == 'minor':
        minor += 1
        patch  = 0
    elif argv[1] == 'patch':
        patch += 1
    newnums = str(major) + '.' + str(minor) + '.' + str(patch)
    open('version', 'w').write(newnums + '\n')
    print(newnums)
else:
    raise Exception('Bad argument count')
