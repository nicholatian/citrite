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

.file "optsmenu/loadtext/buttons.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.equ .Loffs_thingy, 0x30

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options Menu text loader for “Button Layout”
@ DESCRIPTION: This subroutine loads text into VRAM for the menu item
@              applicable to the Button Layout

.section .text
.balign 4
.thumb_func
.globl optsmenu_loadtext_buttons

optsmenu_loadtext_buttons:
    
    PUSH    {R4-R7,LR}
    MOV     R6, R8
    PUSH    {R6}
    SUB     SP, SP, #4
    MOV     R1, SP
    MOV     R2, #0
    STRB    R2, [R1]
    STRB    R2, [R1,#1]
    STRB    R2, [R1,#2]
    ADD     R1, R1, R0
    MOV     R0, #1
    STRB    R0, [R1]
    LDR     R4, =optsmenu_text_normal
    MOV     R0, SP
    LDRB    R3, [R0]
    MOV     R0, R4
    MOV     R1, #0x68 @ 'h'
    MOV     R2, #0x40 @ '@'
    LDR     R7, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    MOV     R0, #1
    MOV     R1, R4
    MOV     R2, #0
    LDR     R7, =font_get_width_of_string
    BL      .Llinker
    
    MOV     R4, R0
    LDR     R0, =optsmenu_text_lr
    MOV     R8, R0
    MOV     R0, #1
    MOV     R1, R8
    MOV     R2, #0
    @LDR     R7, =font_get_width_of_string
    BL      .Llinker
    
    MOV     R5, R0
    LDR     R6, =optsmenu_text_l_a
    MOV     R0, #1
    MOV     R1, R6
    MOV     R2, #0
    @LDR     R7, =font_get_width_of_string
    BL      .Llinker
    
    SUB     R5, #0x5E
    SUB     R4, R4, R5
    SUB     R4, R4, R0
    LSR     R0, R4, #0x1F
    ADD     R4, R4, R0
    ASR     R4, R4, #1
    ADD     R4, #0x68
    MOV     R0, SP
    LDRB    R3, [R0,#1]
    MOV     R0, R8
    MOV     R1, R4
    MOV     R2, #0x40
    LDR     R7, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    MOV     R0, #1
    MOV     R1, R6
    MOV     R2, #0xC6
    LDR     R7, =sub_081DB368
    BL      .Llinker
    
    MOV     R1, R0
    MOV     R0, SP
    LDRB    R3, [R0,#2]
    MOV     R0, R6
    MOV     R2, #0x40
    LDR     R7, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    ADD     SP, SP, #4
    POP     {R3}
    MOV     R8, R3
    POP     {R4-R7}
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
    
    BX      R7

@ End of function optsmenu_loadtext_buttons

@ -----------------------------------------------------------------------------
