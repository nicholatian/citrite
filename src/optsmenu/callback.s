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

.file "optsmenu/callback.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options menu loader callback
@ DESCRIPTION: Callback registered with the superstate for the options menu
@              loader.

.section .text
.balign 4
.thumb_func
.globl optsmenu_load_callback

optsmenu_load_callback:
    
    PUSH    {LR}
    LDR     R1, =task_exec
    BL      .Llinker
    
    LDR     R1, =objc_exec
    BL      .Llinker
    
    LDR     R1, =obj_sync_something
    BL      .Llinker
    
    LDR     R1, =fade_and_return_progress_probably
    BL      .Llinker
    
    POP     {R0}
    BX      R0

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Llinker:
    
    BX      R1

@ End of function optsmenu_load_callback

@ -----------------------------------------------------------------------------
