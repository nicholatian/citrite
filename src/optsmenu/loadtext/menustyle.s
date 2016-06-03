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

.file "optsmenu/loadtext/menustyle.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options Menu text loader for “Menu Style”
@ DESCRIPTION: This subroutine loads text into VRAM for the menu item
@              applicable to the Menu Style

.section .text
.balign 4
.thumb_func
.globl optsmenu_loadtext_menustyle

optsmenu_loadtext_menustyle:
    
    PUSH    {R4-R8,LR}
    SUB     SP, SP, #0x10
    LSL     R0, R0, #0x18
    MOV     R1, #0x1    @ ~LDR R1, #0x1000000
    LSL     R1, R1, #24 @
    ADD     R0, R0, R1
    LSR     R6, R0, #0x18
    MOV     R5, #0
    LDR     R1, =optsmenu_text_color_effect
    LDRB    R0, [R1]
    LDR     R7, =optsmenu_text_type
    CMP     R0, #0xFF
    BEQ     .Ldiv_mod
    
    ADD     R2, R1, #0

.Lloop:
    
    MOV     R0, SP
    ADD     R1, R0, R5
    ADD     R0, R5, R2
    LDRB    R0, [R0]
    STRB    R0, [R1]
    ADD     R0, R5, #1
    LSL     R0, R0, #0x10
    LSR     R5, R0, #0x10
    ADD     R0, R5, R2
    LDRB    R0, [R0]
    CMP     R0, #0xFF
    BEQ     .Ldiv_mod
    
    CMP     R5, #5
    BLS     .Lloop

.Ldiv_mod:
    
    MOV     R0, R6
    MOV     R1, #0xA
    LDR     R8, =__udivsi3
    BL      .Llinker
    
    MOV     R2, R0
    LSL     R0, R2, #0x18
    CMP     R0, #0
    BEQ     .Lmod
    
    MOV     R0, SP
    ADD     R1, R0, R5
    MOV     R0, R2
    ADD     R0, #0xA1 @ 'í'
    STRB    R0, [R1]
    ADD     R0, R5, #1
    LSL     R0, R0, #0x10
    LSR     R5, R0, #0x10
    MOV     R1, SP
    ADD     R4, R1, R5
    MOV     R0, R6
    MOV     R1, #0xA
    LDR     R8, =__umodsi3
    BL      .Llinker
    
    ADD     R0, #0xA1 @ 'í'
    STRB    R0, [R4]
    B       .Lplace_text

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lmod:
    
    MOV     R0, SP
    ADDS    R4, R0, R5
    MOVS    R0, R6
    MOVS    R1, #0xA
    LDR     R8, =__umodsi3
    BL      .Llinker
    
    ADDS    R0, #0xA1 @ 'í'
    STRB    R0, [R4]
    ADDS    R0, R5, #1
    LSLS    R0, R0, #0x10
    LSRS    R5, R0, #0x10
    MOV     R0, SP
    ADDS    R1, R0, R5
    MOVS    R0, #0x77 @ 'w'
    STRB    R0, [R1]

.Lplace_text:
    
    ADDS    R0, R5, #1
    LSLS    R0, R0, #0x10
    LSRS    R5, R0, #0x10
    MOV     R0, SP
    ADDS    R1, R0, R5
    MOVS    R0, #0xFF
    STRB    R0, [R1]
    MOVS    R0, R7
    MOVS    R1, #0x68 @ 'h'
    MOVS    R2, #0x50 @ 'P'
    MOVS    R3, #0
    LDR     R8, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    MOV     R0, SP
    MOVS    R1, #0x80 @ 'Ç'
    MOVS    R2, #0x50 @ 'P'
    MOVS    R3, #1
    LDR     R8, =put_text_on_tilemap_maybe
    BL      .Llinker
    
    ADD     SP, SP, #0x10
    POP     {R4-R8}
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
    
    BX      R8

@ End of function optsmenu_loadtext_menustyle

@ -----------------------------------------------------------------------------
