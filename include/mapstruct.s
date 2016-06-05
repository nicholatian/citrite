@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@                                                                           @@
@@   ########## ####### ######### ##########  ####### ######### ##########   @@
@@   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   @@
@@   ###          ###      ###    ###     ###   ###      ###    ###          @@
@@   ###          ###      ###    #########     ###      ###    #######      @@
@@   ###          ###      ###    ###   ###     ###      ###    ###          @@
@@   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   @@
@@   ########## #######    ###    ###     ### #######    ###    ##########   @@
@@                                                                           @@
@@                          Pokémon Citrite Version                          @@
@@                              OFFICIAL Source                              @@
@@                                                                           @@
@@                  Copyright © 2014-2016 Alexander Nicholi                  @@
@@                            All rights reserved                            @@
@@                                                                           @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.ifndef __mapstruct_asm__
.equ __mapstruct_asm__, 1

.macro mapheader footer, entity, lscript, connect, music, layout, label, darkness, weather, type, showlabel, battlebg
1:
    .word \footer
    .word \entity
    .word \lscript
    .word \connect
    .hword \music
    .hword \layout
    .byte \label
    .byte \darkness
    .byte \weather
    .byte \type
    .hword 0x0000
    .byte \showlabel
    .byte \battlebg
.endm

.macro mapfooter width, height, border, data, blockset_a, blockset_b
1:
    .word \width
    .word \height
    .word \border
    .word \data
    .word \blockset_a
    .word \blockset_b
.endm

.macro mapentity npcnum, warpnum, triggernum, signnum, npcs, warps, triggers, signs
1:
    .byte \npcnum
    .byte \warpnum
    .byte \triggernum
    .byte \signnum
    .word \npcs
    .word \warps
    .word \triggers
    .word \signs
.endm

.macro maplscript type, pointer
1:
    .byte \type
    .word \pointer
.endm

.macro maplsubscript var, val, script
1:
    .hword \var
    .hword \val
    .word \script
.endm

.macro mapconnectheader count, data
1:
    .word \count
    .word \data
.endm

.macro mapnpc pid, sprid, xpos, ypos, height, behave, behaveprop, trainer, viewrad, script, visibility
1:
    .byte \pid
    .byte \sprid
    .hword 0x0
    .hword \xpos
    .hword \ypos
    .byte \height
    .byte \behave
    .hword \behaveprop
    .hword \trainer
    .hword \viewrad
    .word \script
    .hword \visibility
    .hword 0x0
.endm

.macro mapwarp xpos, ypos, height, warp, map, bank
1:
    .hword \xpos
    .hword \ypos
    .byte \height
    .byte \warp
    .byte \map
    .byte \bank
.endm

.macro maptrigger xpos, ypos, height, var, value, script
1:
    .hword \xpos
    .hword \ypos
    .byte \height
    .byte 0x00
    .hword \var
    .hword \value
    .hword 0x0000
    .word \script
.endm

.macro mapsign xpos, ypos, height, script
1:
    .hword \xpos
    .hword \ypos
    .byte \height
    .byte 0x00
    .hword 0x0000
    .word \script
.endm

.macro mapconnection type, offset, bank, map
1:
    .word \type
    .word \offset
    .byte \bank
    .byte \map
    .hword 0x0000
.endm

.macro mapblockset lzcomp, palmode, image, pals, data, behavebg, animasm
1:
    .byte \lzcomp
    .byte \palmode
    .hword 0x0
    .word \image
    .word \pals
    .word \data
    .word \behavebg
    .word \animasm
.endm

.endif
