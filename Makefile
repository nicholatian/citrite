#!/usr/bin/env make
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

# General
RHPATH     := /home/alex/rh
INSTPATH   := /media/cdn/.instance
DEPLOYPATH := /media/remote/arc/citrite
SRCFILES   := $(shell cd src && find . -type f -name '*.c' && cd ..)
ASMFILES   := $(shell cd src && find . -type f -name '*.s' && cd ..)
ASMINCDIR  := include
SRCINCDIR  := $(RHPATH)/include
LIBDIR     := $(RHPATH)/lib
EMERALDROM := rom/emer.gba # Change if elsewhere

# System utilities
AS   := arm-none-eabi-as
CC   := arm-none-eabi-gcc
LD   := arm-none-eabi-ld
OCPY := arm-none-eabi-objcopy
GFX  := grit
PY   := env python3

# Local utilities
TXT2BIN := $(PY) util/txt2bin.py
PAL2BIN := $(PY) util/pal2bin.py
BIN2ASM := $(PY) util/bin2asm.py
NAMEMOD := $(PY) util/namemod.py
VERSION := $(PY) util/version.py
INSERT  := $(PY) util/insert.py
PATCHER := $(PY) util/ipsx.py
UUIDGEN := cat /proc/sys/kernel/random/uuid

ASFLAGS  := -acd -mcpu=arm7tdmi -march=armv4t -mthumb -mthumb-interwork -I \
$(ASMINCDIR) -mlittle-endian -EL --fix-v4bx -meabi=5 -mapcs-32
CCFLAGS  := -ansi -fauto-inc-dec -fcompare-elim -fcprop-registers -fdce \
-fdefer-pop -fdelayed-branch -fdse -fguess-branch-probability \
-fif-conversion2 -fif-conversion -fipa-pure-const -fipa-profile \
-fipa-reference -fmerge-constants -fsplit-wide-types -ftree-bit-ccp \
-ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-copyrename -ftree-dce \
-ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre -ftree-phiprop \
-ftree-sra -ftree-pta -ftree-ter -funit-at-a-time -fomit-frame-pointer \
-fthread-jumps -falign-functions -falign-jumps -falign-loops -falign-labels \
-fcaller-saves -fcrossjumping -fcse-follow-jumps -fcse-skip-blocks \
-fdelete-null-pointer-checks -fdevirtualize -fexpensive-optimizations -fgcse \
-fgcse-lm -finline-small-functions -findirect-inlining -fipa-sra \
-foptimize-sibling-calls -fpartial-inlining -fpeephole2 -fregmove \
-freorder-blocks -freorder-functions -frerun-cse-after-loop \
-fsched-interblock -fsched-spec -fschedule-insns -fschedule-insns2 \
-fstrict-aliasing -fstrict-overflow -ftree-switch-conversion \
-ftree-tail-merge -ftree-pre -ftree-vrp -finline-functions -funswitch-loops \
-fpredictive-commoning -fgcse-after-reload -ftree-slp-vectorize \
-fvect-cost-model -fipa-cp-clone -ffast-math -fno-protect-parens \
-fstack-arrays -fforward-propagate -finline-functions-called-once \
-fmerge-all-constants -fmodulo-sched -fmodulo-sched-allow-regmoves -fgcse-sm \
-fgcse-las -funsafe-loop-optimizations -fconserve-stack -I$(SRCINCDIR) \
-iquote src -mthumb -mthumb-interwork -mlong-calls -O2 -c -w
LDFLAGS  := -nostdlib -T etc/gba.ld -T etc/bpee.ld
GFXFLAGS := -m -ftb -fh!

# use this for globbing onto sources
# $(shell find <dir>/ -type f -name '*.<ext>')

# Tile-based images, normal reductions
IMAGES4TUNC := $(shell find data/image/ -type f -name '*.4bpp.t.png')
IMAGES4TLZ  := $(shell find data/image/ -type f -name '*.4bpp.lz.t.png')
IMAGES8TUNC := $(shell find data/image/ -type f -name '*.8bpp.t.png')
IMAGES8TLZ  := $(shell find data/image/ -type f -name '*.8bpp.lz.t.png')

# Tile-based images, no reduction performed
IMAGES4TNUNC := $(shell find data/image/ -type f -name '*.4bpp.tn.png')
IMAGES4TNLZ  := $(shell find data/image/ -type f -name '*.4bpp.lz.tn.png')
IMAGES8TNUNC := $(shell find data/image/ -type f -name '*.8bpp.tn.png')
IMAGES8TNLZ  := $(shell find data/image/ -type f -name '*.8bpp.lz.tn.png')

# Bitmap images
IMAGES4BUNC := $(shell find data/image/ -type f -name '*.4bpp.b.png')
IMAGES4BLZ  := $(shell find data/image/ -type f -name '*.4bpp.lz.b.png')
IMAGES8BUNC := $(shell find data/image/ -type f -name '*.8bpp.b.png')
IMAGES8BLZ  := $(shell find data/image/ -type f -name '*.8bpp.lz.b.png')

POKETEXTS := $(shell find data/text/ -type f -name '*.snip')
MAPFILES  := $(shell find data/map/ -type f -name '*.amap')
PALETTES  := $(shell find data/image/ -type f -name '*.npal')
BINARIES  := $(shell find data/other/ -type f -name '*.bin')

.PHONY: rom all src images imagesb imagest images4b images4blz images8b \
	images8blz images4t images4tlz images8t images8tlz poketext palettes maps \
	assemble link copybin insert patch deploymajor deployminor deploypatch \
	_incrmajor _incrminor _incrpatch _deploy instance clean

rom: src images poketexts palettes maps assemble link copybin insert

all: rom patch

src:
	@mkdir -p bin/code
	@for SRCFILE in $(SRCFILES) ; do \
		NEWNAME=`$(NAMEMOD) -a $$SRCFILE` ; \
		$(CC) $(CCFLAGS) src/$$SRCFILE -o bin/code/$$NEWNAME.o ; \
	done

images: imagesb imagestn imagest

imagesb: images4b images4blz images8b images8blz

imagestn: images4tn images4tnlz images8tn images8tnlz

imagest: images4t images4tlz images8t images8tlz

images4b:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4B) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -gb -gz! -mz! -gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_pal.bin ; \
	done

images4blz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4BLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -gb -gzl -mzl -gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_pal.bin ; \
	done

images8b:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8B) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -gb -gz! -mz! -gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_pal.bin ; \
	done

images8blz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8BLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -gb -gzl -mzl -gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_pal.bin ; \
	done

images4tn:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4TN) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mR! -gz! -mz! \
		-gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images4tnlz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4TNLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mR! -gzl -mzl \
		-gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images8tn:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8TN) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mR! -gz! -mz! \
		-gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images8tnlz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8TNLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mR! -gzl -mzl \
		-gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images4t:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4T) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mRtf -gz! -mz! \
		-gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images4tlz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES4TLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mRtf -gzl -mzl \
		-gB4 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images8t:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8T) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mRtf -gz! -mz! \
		-gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

images8tlz:
	@mkdir -p bin/data/image
	@for CURIMG in $(IMAGES8TLZ) ; do \
		BNAME=`$(NAMEMOD) -l $$CURIMG` ; \
		ANAME=`$(NAMEMOD) -a $$CURIMG` ; \
		echo ".file \"$$CURIMG\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(GFX) $$CURIMG $(GFXFLAGS) -obin/$$BNAME.x.bin -mRtf -gzl -mzl \
		-gB8 ; \
		mv bin/$$BNAME.img.bin bin/$${ANAME}_img.bin ; \
		mv bin/$$BNAME.map.bin bin/$${ANAME}_map.bin ; \
		mv bin/$$BNAME.pal.bin bin/$${ANAME}_pal.bin ; \
		$(BIN2ASM) bin/$${ANAME}_img.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_map.bin >> bin/temp.s ; \
		$(BIN2ASM) bin/$${ANAME}_pal.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/temp.s bin/$${ANAME}_img.bin bin/$${ANAME}_map.bin \
		bin/$${ANAME}_pal.bin ; \
	done

poketexts:
	@mkdir -p bin/data/text
	@for SNIPPET in $(POKETEXTS) ; do \
		BNAME=`$(NAMEMOD) -l $$SNIPPET` ; \
		echo ".file \"$$SNIPPET\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(TXT2BIN) $$SNIPPET bin/$$BNAME.bin ; \
		$(BIN2ASM) bin/$$BNAME.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/text/$$BNAME.o ; \
		rm bin/$$BNAME.bin bin/temp.s ; \
	done

palettes:
	@mkdir -p bin/data/image
	@for PALETTE in $(PALETTES) ; do \
		BNAME=`$(NAMEMOD) -l $$PALETTE` ; \
		echo ".file \"$$PALETTE\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(PAL2BIN) $$PALETTE bin/$$BNAME.bin ; \
		$(BIN2ASM) bin/$$BNAME.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/image/$$BNAME.o ; \
		rm bin/$$BNAME.bin bin/temp.s ; \
	done

maps:
	@mkdir -p bin/data/map
	@for MAPFILE in $(MAPFILES) ; do \
		BNAME=`$(NAMEMOD) -l $$MAPFILE` ; \
		echo ".file \"$$MAPFILE\"" > bin/temp.s ; \
		echo '.ident "AS: (devkitARM release 45) 2.25.1"' >> bin/temp.s ; \
		$(MAP2BIN) $$MAPFILE bin/$$BNAME.bin ; \
		$(BIN2ASM) bin/$$BNAME.bin >> bin/temp.s ; \
		$(AS) $(ASFLAGS) bin/temp.s -o bin/data/text/$$BNAME.o ; \
		rm bin/temp.s bin/$$BNAME.bin ; \
	done

assemble:
	@mkdir -p bin/code
	@for ASMFILE in $(ASMFILES) ; do \
		MANGLED=`$(NAMEMOD) -ma $$ASMFILE` ; \
		$(AS) $(ASFLAGS) src/$$ASMFILE -o bin/code/$$MANGLED.o ; \
	done

link:
	@$(LD) $(LDFLAGS) -o bin/citrite.elf `find bin/code -type f -name '*.o'` \
	`find bin/data -type f -name '*.o'`

copybin:
	@$(OCPY) -O binary bin/citrite.elf bin/citrite.bin

insert:
	@$(INSERT) etc/hooks.list $(EMERALDROM) bin/citrite.bin bin/citrite.elf \
	bin/citrite.gba

patch:
	$(PATCHER) -c $(EMERALDROM) bin/citrite.gba bin/patch.ipsx

deploymajor: patch _incrmajor _deploy

deployminor: patch _incrminor _deploy

deploypatch: patch _incrpatch _deploy

_incrmajor:
	@$(VERSION) major

_incrminor:
	@$(VERSION) minor

_incrpatch:
	@$(VERSION) patch

_deploy:
	@VER=`$(VERSION)`
	@mkdir -p deploy
	@cp bin/patch.ipsx deploy/citrite.ipsx
	@cp util/ipsx.pyc deploy/patcher.pyc
	@cp etc/README.txt deploy/README.txt
	@mv deploy citrite-$$VER
	@zip bin/citrite.zip citrite-$$VER
	@rm -rf citrite-$$VER
	@cp bin/citrite.zip $(DEPLOYPATH)/citrite-$$VER.zip

instance:
	@$(UUIDGEN) > tmp
	@mkdir $(INSTPATH)/`cat tmp`
	@cp $(DEPLOYPATH)/citrite-`cat version`.zip \
	$(INSTPATH)/`cat tmp`/citrite.zip
	@echo \
	"http://trinidad.cloud.securelateral.net/.instance/`cat tmp`/citrite.zip"
	@rm -f tmp

clean:
	@rm -rf ./bin
