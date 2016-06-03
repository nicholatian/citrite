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

.file "optsmenu/loadtext/battlescene.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.equ .Loffs_thingy, 0x10

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options Menu text loader for “Battle Scene”
@ DESCRIPTION: This subroutine loads text into VRAM for the menu item
@              applicable to the Battle Scene.

.section .text
.balign 4
.thumb_func
.globl optsmenu_loadtext_battlescene

optsmenu_loadtext_battlescene:
    
    PUSH    {R4,R5,LR}
    SUB     SP, SP, #4
    MOV     R1, SP
    MOV     R2, #0
    STRB    R2, [R1]
    STRB    R2, [R1,#1]
    ADD     R1, R1, R0
    MOV     R0, #1
    STRB    R0, [R1]
    LDR     R0, =optsmenu_text_on
    MOV     R1, SP
    LDRB    R3, [R1]
    MOV     R1, #0x68
    MOV     R2, #.Loffs_thingy
    LDR     R5, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    LDR     R4, =optsmenu_text_off
    MOV     R0, #1
    MOV     R1, R4
    MOV     R2, #0xC6
    LDR     R5, =sub_081DB368
    BL      .Llinker
    
    MOV     R1, R0
    MOV     R0, SP
    LDRB    R3, [R0,#1]
    MOV     R0, R4
    MOV     R2, #.Loffs_thingy
    LDR     R5, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    ADD     SP, SP, #4
    POP     {R4,R5}
    POP     {R0}
    BX      R0

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Llinker:
    
    BX      R5

@ End of function optsmenu_loadtext_battlescene

@ -----------------------------------------------------------------------------
