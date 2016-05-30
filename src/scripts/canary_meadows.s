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

.file "scripts/canary_meadows.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "pokescript.s"
.include "definitions.s"


@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Scripts for Canary Meadows
@ DESCRIPTION: These scripts are for interactions on the Canary Meadows maps.


@@ noreturn groundzero_warn_sign( void )
@@
@@ max call depth: 0

.globl groundzero_warn_sign
.balign 4, 0

radioactive_sign:
    
    s_loadptr 0x0 radioactive_sign_text
    s_callstd MSG_SIGN
    s_end



@@ noreturn rudyhouse_sign( void )
@@
@@ max call depth: 0

.globl rudyhouse_sign
.balign 4, 0

rudyhouse_sign:
    
    s_loadptr 0x0 rudyhouse_text
    s_callstd MSG_SIGN
    s_end



@@ noreturn tb_canarymeadow_camper( void )
@@
@@ max call depth: 0

.globl tb_canary_camper
.balign 4, 0

tb_canary_camper:
    
    s_tbattle 0x0 0x1 0x0 canary_camper_intro canary_camper_defeat
    s_loadptr 0x0 canary_camper_after
    s_callstd MSG_NORMAL
    s_end



@@ noreturn tb_canarymeadow_pokefan( void )
@@
@@ max call depth: 0

.globl tb_canary_pokefan
.balign 4, 0

tb_canary_pokefan:
    
    s_tbattle 0x0 0x2 0x0 canary_pokefan_intro canary_pokefan_defeat
    s_loadptr 0x0 canary_pokefan_after
    s_callstd MSG_NORMAL
    s_end



@@ noreturn canarymeadow_itemball1( void )
@@
@@ max call depth: 0

.globl canary_itemball1
.balign 4, 0

canary_itemball1:
    
    s_setorcopyvar 0x8000 POTION
    s_setorcopyvar 0x8001 1
    s_callstd MSG_FIND
    s_end



@@ noreturn canarymeadow_itemball2( void )
@@
@@ max call depth: 0

.globl canary_itemball2
.balign 4, 0

canary_itemball2:
    
    s_setorcopyvar 0x8000 POKEBALL
    s_setorcopyvar 0x8001 1
    s_callstd MSG_FIND
    s_end



@@ noreturn canarymeadow_itemball3( void )
@@
@@ max call depth: 0

.globl canary_itemball3
.balign 4, 0

canary_itemball3:
    
    s_setorcopyvar 0x8000 PEARL
    s_setorcopyvar 0x8001 1
    s_callstd MSG_FIND
    s_end



@@ noreturn canarybattle( void )
@@
@@ max call depth: 1

.globl canarybattle
.balign 4, 0

canarybrawl:
    
    s_lockall
    s_move PLAYER .Lbattle_moveback
    s_waitmove 0x0
    s_storepokemon 0x0 ZIGZAGOON
    s_storeattack 0x1 TACKLE
    s_loadptr 0x0 canary_brawl_usetackle
    s_callstd MSG_STANDARD
    s_pause 0x28
    s_move CANARYBATTLE_ZIGZAGOON .Lbattle_tackle
    s_pause 0x18
    s_setvar 0x8000 CANARYBATTLE_TRAINER
    s_setvar 0x8001 true
    s_call do_exclbubble
    s_pause 0x40
    s_releaseall
    s_end

.Lbrawl_moveback:
    
    .byte 0x08, 0x08, 0x22, 0xFE

.Lbattle_tackle:
    
    .byte 0x45, 0x40, 0x17, 0x17, 0x41, 0xFE



@@ noreturn canary_zigzagoon( void )
@@
@@ max call depth: 0

.globl canary_zigzagoon
.balign 4, 0

canary_zigzagoon:
    
    s_lock
    s_message canary_zigzagoon_text
    s_waitsfx
    s_cry ZIGZAGOON 0x0
    s_showmsg
    s_waitcry
    s_waitbutton
    s_release
    s_end



@@ noreturn canary_skitty( void )
@@
@@ max call depth: 0

.globl canary_skitty
.balign 4, 0

canary_skitty:
    
    s_lock
    s_message canary_skitty_text
    s_waitsfx
    s_cry SKITTY 0x0
    s_showmsg
    s_waitcry
    s_waitbutton
    s_release
    s_end



@@ noreturn canary_redtrainer( void )
@@
@@ max call depth: 0

.globl canary_redtrainer
.balign 4, 0

canary_redtrainer:
    
    s_loadptr 0x0 canary_redtrainer_text
    s_callstd MSG_NORMAL
    s_spriteface LASTTALKED RIGHT
    s_end
