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
from glob import glob
from os   import path, sep
from sys  import exit, stderr
def run(command):
    import subprocess
    try:
        return subprocess.check_output(command).decode()
    except subprocess.CalledProcessError as e:
        print(e.output.decode(), file=stderr)
        exit(1)
def getFileLevel(fname):
    return int(fname.split('.')[-2], 10)
def orderedPaths(levels, upaths):
    # check out how many different priorities we have
    variety = []
    for level in levels:
        if level not in variety:
            variety += [level]
    # order the variety
    variety.sort()
    opaths = []
    # order the paths
    for inst in variety:
        for i2, level in enumerate(levels):
            if level == inst:
                opaths += [upaths[i2]]
    return opaths
olist = []
snips = glob('data/text/*.snip')
imgs  = glob('data/image/*.png')
maps  = glob('data/map/*.map')
codes = glob('asm/*.asm') + glob('asm/**/*.asm') + glob('src/*.c') + glob('src/**/*.c')
for item in imgs:
    olist += [path.join('bin', 'data', 'image', run(['env', 'python3', 'util/namemod.py', '-l', item])[:-1] + '.o')]
for item in snips:
    olist += [path.join('bin', 'data', 'text', run(['env', 'python3', 'util/namemod.py', '-l', item])[:-1] + '.o')]
levels = []
upaths = []
for item in codes:
    lv = getFileLevel(item)
    # ignore priority 0 files entirely
    if not lv:
        continue
    levels += [lv]
    # remove the filename from the list
    dirs    = item.split(sep)[1:-1]
    lendirs = len(dirs)
    if lendirs > 0:
        pdirs = ''
        if lendirs > 1:
            pdirs = '+'.join(dirs)
        else:
            pdirs = dirs[0]
        upaths += [path.join('bin', 'code', pdirs + '+' + run(['env', 'python3', 'util/namemod.py', '-a', item])[:-1] + '.o')]
    else:
        upaths += [path.join('bin', 'code', run(['env', 'python3', 'util/namemod.py', '-a', item])[:-1] + '.o')]
olist += orderedPaths(levels, upaths)
print(' '.join(list(reversed(olist))))
