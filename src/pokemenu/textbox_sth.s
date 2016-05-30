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

.file "pokemenu/textox_sth.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ ============================ S U B R O U T I N E ============================
@
@ TITLE:       Unknown Subroutine (Pokémenu- and textbox-related)
@ DESCRIPTION: No details yet

.section .text
.balign 4
.thumb_func
.globl pokemenu_textbox_sth

@@ void pokemenu_textbox_sth( void )

pokemenu_textbox_sth:
    
    PUSH    {R4-R7,LR}
    MOV     R7, R9
    MOV     R6, R8
    PUSH    {R6,R7}
    LDR     R4, =0x203CEDC
    MOV     R0, #0x60
    LDR     R1, =malloc
    BL      .Llinker
    
    STR     R0, [R4]
    MOV     R5, #0
    LSL     R0, R7, #1
    ADD     R0, R0, R7
    LSL     R0, R0, #4
    MOV     R8, R0
    MOV     R6, #0xFF
    MOV     R9, R4

.Lloop:
    LDR     R2, [R4]
    LSL     R3, R5, #4
    ADD     R2, R3, R2
    LDR     R0, =0x86156E4
    MOV     R12, R0
    STR     R0, [R2]
    LSL     R0, R5, #3
    LDR     R1, =0x8615704
    ADD     R0, R0, R1
    ADD     R0, R8
    STR     R0, [R2,#4]
    STRB    R5, [R2,#8]
    LDR     R1, [R4]
    ADD     R1, R3, R1
    LDRB    R0, [R1,#9]
    ORR     R0, R6
    STRB    R0, [R1,#9]
    LDR     R1, [R4]
    ADD     R1, R3, R1
    LDRB    R0, [R1,#0xA]
    ORR     R0, R6
    STRB    R0, [R1,#0xA]
    LDR     R1, [R4]
    ADD     R1, R3, R1
    LDRB    R0, [R1,#0xB]
    ORR     R0, R6
    STRB    R0, [R1,#0xB]
    LDR     R0, [R4]
    ADD     R3, R3, R0
    LDRB    R0, [R3,#0xC]
    ORR     R0, R6
    STRB    R0, [R3,#0xC]
    ADD     R0, R5, #1
    CMP     R5, #5
    BLS     .Lloop
    
    MOV     R1, R9
    LDR     R0, [R1]
    MOV     R1, R12
    SUB     R1, #0x20 @ ' '
    STR     R1, [R0]
    CMP     R7, #3
    BNE     .Lstore_sth
    
    STR     R1, [R0,#0x30]
    B       .Lreturn

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lstore_sth:
    
    CMP     R7, #0
    BEQ     .Lreturn
    
    STR     R1, [R0,#0x10]

.Lreturn:
    
    POP     {R3,R4}
    MOV     R8, R3
    MOV     R9, R4
    POP     {R4-R7}
    POP     {R0}
    BX      R0

.Llinker:
    
    BX      R1

@ End of function sub_081B0740

@ ---------------------------------------------------------------------------
