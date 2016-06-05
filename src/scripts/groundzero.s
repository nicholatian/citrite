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

.file "scripts/groundzero.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "pokescript.s"
.include "defs.s"

.section .data
.balign 4, 0


@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Ground Zero scripts
@ DESCRIPTION: The collection of scripts used within Ground Zero.


@@ noreturn traveling_bag()
@@
@@ max call depth: 0

.globl traveling_bag
.balign 4, 0

traveling_bag:
    
    s_lock
    s_message travelbag_foundbag
    s_disappear 0x1
    s_fanfare OBTAINED_TMHM
    s_showmsg
    s_waitfanfare
    s_loadptr 0x0 travelbag_contents
    s_callstd MSG_NORMAL
    s_additem FRESHWATER, 6
    s_additem POKEBALL, 20
    s_additem STARDUST, 10
    s_setflag 0x100
    s_release
    s_end



@@ noreturn set_runningshoes()
@@
@@ max call depth: 0

.globl set_runningshoes
.balign 4, 0

set_runningshoes:
    
    s_setflag EM_RUNNINGSHOES
    s_end



@@ noreturn groundzero_signpost()
@@
@@ max call depth: 0

.globl groundzero_signpost
.balign 4, 0

groundzero_signpost:
    
    s_loadptr 0x0 gzero_signpost_text
    s_callstd MSG_SIGN
    s_end



@@ noreturn obtain_starter()
@@
@@ max call depth: 0

.globl obtain_starter
.balign 4, 0

obtain_starter:
    
    s_fadesong 0x0
    s_pause 0x50
    s_loadptr 0x0 obt_starter_blurb
    s_callstd MSG_STANDARD
    s_setmaptile 0xD 0x1 0x20D 0x1
    s_special SETMAPTILE
    s_bufferpoke 0 BELDUM
    s_message obtained_vh02
    s_givepoke BELDUM 10 ORANBERRY 0 0 0
    s_setflag EM_POKEMON
    s_fanfare OBTAINED_ITEM
    s_showmsg
    s_waitfanfare
    s_waitbutton
    s_release
    s_pause 0x30
    s_fadesong 0x1B6
    s_end



@@ noreturn groundzero_lab_showball()
@@
@@ max call depth: 0

.globl groundzero_lab_showball
.balign 4, 0

groundzero_lab_showball:
    
    s_checkflag EM_POKEMON
    s_if 0x0 "jump" end
    s_setmaptile 0xD 0x1 0x20D 0x1
    s_special SETMAPTILE
    s_end
