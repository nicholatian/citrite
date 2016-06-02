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

.file "optsmenu/vblanker.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options menu loader V-blank handler
@ DESCRIPTION: V-blank handler registered with the superstate for the options
@              menu loader.

.section .text
.balign 4
.thumb_func
.globl optsmenu_load_vblanker

optsmenu_load_vblanker:
    
    PUSH    {LR}
    LDR     R1, =gpu_sprites_upload
    BL      .Llinker
    
    LDR     R1, =copy_queue_process
    BL      .Llinker
    
    LDR     R1, =gpu_pal_upload
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

@ End of function optsmenu_load_vblanker

@ -----------------------------------------------------------------------------
