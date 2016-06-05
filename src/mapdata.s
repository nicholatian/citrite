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

.file "mapdata.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "mapstruct.s"
.include "defs.s"

.equ MUSIC_GROUNDZERO, ISLAND_CAVE
.equ MUSIC_INSIDE, FORTREE_CITY

.section .data
.balign 4, 0


@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Overworld map metadata
@ DESCRIPTION: A collection of pointers and macros comprising all of the data
@              needed to create the game’s maps, except for the map blocks.
@              While most of this implementation is localised, two symbols are
@              exposed to other compilation units: the map bank header, and the
@              map layout table. These will be hooked into the ROM via ld.



@ =========================== D A T A   C A C H E =========================== @


@@ globl word[] .Lbankheader

.globl map_bank_header
.balign 4, 0

map_bank_header:
    
    .word .Lbank0
    .word .Lbank1
    .word .Lbank2
    .word .Lbank3



@@ word[] .Lbank0

.Lbank0:
    
    .word .Lheader_failsafe
    .word .Lheader_debug



@@ word[] .Lbank1

.Lbank1:
    
    .word .Lheader_groundzero
    .word .Lheader_canarymeadows
    .word .Lheader_tryonhilltops



@@ word[] .Lbank2

.Lbank2:
    
    .word .Lheader_groundzero0
    .word .Lheader_groundzero1
    .word .Lheader_groundzero2
    .word .Lheader_groundzero3
    .word .Lheader_canarymeadows0



@@ word[] .Lbank3

.Lbank3:
    
    .word .Lheader_amaltheajungle


@ =========================== D A T A   C A C H E =========================== @


@@ mapheader .Lheader_failsafe

.Lheader_failsafe:
    
    mapheader .Lfooter_failsafe, .Lentity_failsafe, 0, 0, TEACHY_TV, 1, 0, 0, 0, 1, 1, 1



@@ mapheader .Lheader_debug

.Lheader_debug:
    
    mapheader .Lfooter_debug, .Lentity_failsafe, 0, 0, TEACHY_TV, 2, 0, 0, 0, 1, 1, 1



@@ mapheader .Lheader_groundzero

.Lheader_groundzero:
    
    mapheader .Lfooter_groundzero, .Lentity_groundzero, .Llscript_groundzero, .Lconnect_groundzero, MUSIC_GROUNDZERO, 3, 1, 0, 7, 3, 1, 0



@@ mapheader .Lheader_canarymeadows

.Lheader_canarymeadows:
    
    mapheader .Lfooter_canarymeadows, .Lentity_canarymeadows, 0, .Lconnect_canarymeadows, ROUTE_15, 4, 2, 0, 2, 0, 1, 0



@@ mapheader .Lheader_tryonhilltops

.Lheader_tryonhilltops:
    
    mapheader .Lfooter_tryonhilltops, 0, 0, .Lconnect_tryonhilltops, TEACHY_TV, 5, 3, 0, 2, 0, 1, 0



@@ mapheader .Lheader_groundzero0

.Lheader_groundzero0:
    
    mapheader .Lfooter_groundzero0, .Lentity_groundzero0, 0, 0, MUSIC_GROUNDZERO, 6, 1, 0, 0, 0, 0, 0



@@ mapheader .Lheader_groundzero1

.Lheader_groundzero1:
    
    mapheader .Lfooter_groundzero1, .Lentity_groundzero1, 0, 0, MUSIC_GROUNDZERO, 7, 1, 0, 0, 0, 0, 0



@@ mapheader .Lheader_groundzero2

.Lheader_groundzero2:
    
    mapheader .Lfooter_groundzero2, .Lentity_groundzero2, 0, 0, MUSIC_GROUNDZERO, 1, 0, 0, 0, 0, 0



@@ mapheader .Lheader_groundzero3

.Lheader_groundzero3:
    
    @ TODO: Rework the level scripts that used to be here into the main map
    mapheader .Lfooter_groundzero3, .Lentity_groundzero3, .Llscript_groundzero3, 0, MUSIC_GROUNDZERO, 9, 1, 0, 0, 0, 0, 0



@ mapheader .Lheader_canarymeadows0

.Lheader_canarymeadows0:
    
    mapheader .Lfooter_canarymeadows0, 0, 0, 0, MUSIC_INSIDE, 10, 2, 0, 0, 0, 0, 0



@ mapheader .Lheader_amaltheajungle

.Lheader_amaltheajungle:
    
    mapheader .Lfooter_amaltheajungle, 0, 0, 0, TEACHY_TV, 11, 4, 0, 0xC, 0, 1, 0


@ =========================== D A T A   C A C H E =========================== @


.Lfooter_failsafe:
    
    mapfooter 9, 9, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero

.Lfooter_debug:
    
    mapfooter 15, 15, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero

.Lfooter_groundzero:
    
    mapfooter 120, 40, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero

.Lfooter_canarymeadows:
    
    mapfooter 90, 30, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero

.Lfooter_tryonhilltops:
    
    mapfooter 30, 30, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero

.Lfooter_groundzero0:
    
    mapfooter 11, 9, 000, 000, .Lblockset_pcmartgarbage, .Lblockset_indoors

.Lfooter_groundzero1:
    
    mapfooter 11, 9, 000, 000, .Lblockset_pcmartgarbage, .Lblockset_indoors

.Lfooter_groundzero2:
    
    mapfooter 11, 9, 000, 000, .Lblockset_pcmartgarbage, .Lblockset_indoors

.Lfooter_groundzero3:
    
    mapfooter 15, 9, 000, 000, .Lblockset_pcmartgarbage, .Lblockset_pokelab

.Lfooter_canarymeadows0:
    
    mapfooter 14, 9, 000, 000, .Lblockset_pcmartgarbage, .Lblockset_indoors

.Lfooter_amaltheajungle:
    
    mapfooter 1, 1, 000, 000, .Lblockset_outdoors, .Lblockset_groundzero


@ =========================== D A T A   C A C H E =========================== @


.Lentity_failsafe:
    
    mapentity 0, 1, 0, 1, 0, .Lwarps_failsafe, 0, .Lsigns_failsafe

.Lentity_debug:
    
    mapentity 0, 1, 0, 0, 0, .Lwarps_failsafe, 0, 0

.Lentity_groundzero:
    
    mapentity 5, 4, 0, 1, .Lnpcs_groundzero, .Lwarps_groundzero, 0, .Lsigns_groundzero

.Lentity_canarymeadows:
    
    mapentity 9, 3, 1, 2, .Lnpcs_canarymeadows, .Lwarps_canarymeadows, .Ltriggers_canarymeadows, .Lsigns_canarymeadows

.Lentity_groundzero0:
    
    mapentity 0, 2, 0, 0, 0, .Lwarps_groundzero0, 0, 0

.Lentity_groundzero1:
    
    mapentity 0, 2, 0, 0, 0, .Lwarps_groundzero1, 0, 0

.Lentity_groundzero2:
    
    mapentity 0, 2, 0, 0, 0, .Lwarps_groundzero2, 0, 0

.Lentity_groundzero3:
    
    mapentity 0, 2, 0, 0, 0, .Lwarps_groundzero3, 0, 0


@ =========================== D A T A   C A C H E =========================== @


.Llscript_groundzero:
    
    maplscript 3, set_runningshoes
    .byte 0
    .balign 4, 0xFF

.Llscript_groundzero3:
    
    maplscript 1, groundzero_lab_showball
    .byte 0
    .balign 4, 0xFF


@ =========================== D A T A   C A C H E =========================== @


.Lconnect_groundzero:
    
    mapconnectheader 1, .Lconnectdata_groundzero

.Lconnect_canarymeadows:
    
    mapconnectheader 2, .Lconnectdata_canarymeadows

.Lconnect_tryonhilltops:
    
    mapconnectheader 1, .Lconnectdata_tryonhilltops


@ =========================== D A T A   C A C H E =========================== @


.Lnpcs_groundzero:
    
    mapnpc 1, 97, 0x6, 0x12, 3, 1, 0, 0, 0, traveling_bag, 0x100
    mapnpc 2, 86, 0x5B, 0x4, 3, 0, 0, 0, 0, rock_smash, 0x11
    mapnpc 3, 86, 0x5B, 0x4, 3, 0, 0, 0, 0, rock_smash, 0x12
    mapnpc 4, 86, 0x5B, 0x4, 3, 0, 0, 0, 0, rock_smash, 0x13
    mapnpc 5, 86, 0x5B, 0x4, 3, 0, 0, 0, 0, rock_smash, 0x14

.Lnpcs_canarymeadows:
    
    mapnpc 1, 13, 0x11, 0x2, 3, 10, 0, 0, 0, 0, 0
    mapnpc 2, 15, 0x15, 0x2, 3, 9, 0, 0, 0, canary_redtrainer, 0
    mapnpc 3, 98, 0x12, 0x2, 3, 10, 0, 0, 0, canary_zigzagoon, 0
    mapnpc 4, 203, 0x14, 0x2, 3, 9, 0, 0, 0, canary_skitty, 0
    mapnpc 5, 59, 0x8, 0x6, 3, 1, 0, 0, 0, canary_itemball1, 0x102
    mapnpc 6, 59, 0x8, 0x6, 3, 1, 0, 0, 0, canary_itemball2, 0x103
    mapnpc 7, 59, 0x8, 0x6, 3, 1, 0, 0, 0, canary_itemball3, 0x104
    mapnpc 8, 31, 0x45, 0x9, 3, 17, 0, 0, 0x100, tb_canary_camper, 0
    mapnpc 9, 25, 0x39, 0x4, 3, 17, 0, 0, 0x100, tb_canary_pokefan, 0

.equ CANARYBATTLE_TRAINER, 2
.globl CANARYBATTLE_TRAINER

.Lnpcs_groundzero2:
    
    mapnpc 1, 60, 0xD, 0x1, 3, 12, 0, 0, 0, obtain_starter, 0


@ =========================== D A T A   C A C H E =========================== @


.Lwarps_failsafe:
    
    mapwarp 0x1, 0x4, 3, 127, 127, 127

.Lwarps_groundzero:
    
    mapwarp 0x37 0x1A, 3, 0, 0, 2
    mapwarp 0x3B 0x18, 3, 0, 1, 2
    mapwarp 0x3F 0x18, 3  0, 2, 2
    mapwarp 0x4D 0xE, 3, 0, 3, 2

.Lwarps_canarymeadows:
    
    mapwarp 0x24, 0x7, 3, 0, 4, 2
    mapwarp 0x4E, 0xA, 3, 0, 0, 3
    mapwarp 0x4F, 0xA, 3, 1, 0, 3

.Lwarps_groundzero0:
    
    mapwarp 0x3, 0x8, 3, 1, 0, 0
    mapwarp 0x4, 0x8, 3, 1, 0, 0

.Lwarps_groundzero1:
    
    mapwarp 0x3, 0x8, 3, 1, 0, 1
    mapwarp 0x4, 0x8, 3, 1, 0, 1

.Lwarps_groundzero2:
    
    mapwarp 0x3, 0x8, 3, 1, 0, 2
    mapwarp 0x4, 0x8, 3, 1, 0, 2

.Lwarps_groundzero3:
    
    mapwarp 0x3, 0x8, 3, 1, 0, 3
    mapwarp 0x4, 0x8, 3, 1, 0, 3


@ =========================== D A T A   C A C H E =========================== @


.Ltriggers_canarymeadows:
    
    maptrigger 0x13, 0x2, 3, 0x4050, 0x0, canary_brawl


@ =========================== D A T A   C A C H E =========================== @


.Lsigns_failsafe:
    
    mapsign 0x4, 0x3, 3, failsafe_message

.Lsigns_groundzero:
    
    mapsign 0x3C, 0x1C, 3, groundzero_signpost

.Lsigns_canarymeadows:
    
    mapsign 0x26, 0x9, 3, rudyhouse_sign
    mapsign 0x1B, 0x15, 3, radioactive_sign


@ =========================== D A T A   C A C H E =========================== @


.Lconnectdata_groundzero:
    
    mapconnection 2, 72, 1, 1

.Lconnectdata_canarymeadows:
    
    mapconnection 1, -72, 1, 0

.Lconnectdata_tryonhilltops:
    
    mapconnection 1, 0, 1, 1


@ =========================== D A T A   C A C H E =========================== @


.globl map_layout_table
map_layout_table:
    
    .word .Lfooter_failsafe
    .word .Lfooter_debug
    .word .Lfooter_groundzero
    .word .Lfooter_canarymeadows
    .word .Lfooter_tryonhilltops
    .word .Lfooter_groundzero0
    .word .Lfooter_groundzero1
    .word .Lfooter_groundzero2
    .word .Lfooter_groundzero3
    .word .Lfooter_canarymeadows0
    .word .Lfooter_amaltheajungle


@ =========================== D A T A   C A C H E =========================== @


.Lblockset_outdoors:
    
    mapblockset 0, 0, 000, 000, 000, 000, 000

.Lblockset_indoors:
    
    mapblockset 0, 1, 000, 000, 000, 000, 000

.Lblockset_pcmartgarbage:
    
    mapblockset 0, 0, 000, 000, 000, 000, 000

.Lblockset_pokelab:
    
    mapblockset 0, 1, 000, 000, 000, 000, 0

.Lblockset_groundzero:
    
    mapblockset 0, 1, 000, 000, 000, 000, 0
