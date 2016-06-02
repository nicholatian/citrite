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

.file "citgpu/set_priority.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Routine to set the priority of a BG
@ DESCRIPTION: Takes a BGID (0-3) and a priority (0-3) and sets the bits that
@              control the BGID’s priority to the given value.

.section .text
.balign 4
.thumb_func
.globl citgpu_set_priority

citgpu_set_priority:
    
    PUSH    {LR}
    PUSH    {R4}
    
    CMP     R0, #3
    BGT     .Lreturn
    
    CMP     R1, #3
    BGT     .Lreturn
    
    @ Get the appropriate I/O register
    MOV     R2, #0x4    @ ~LDR R3, #0x4000000
    LSL     R2, R2, #24 @
    LSL     R0, R0, #1
    ADD     R2, R2, R0
    
    @ Clear the priority bits
    LDR     R3, [R2]
    MOV     R4, #3
    BIC     R3, R4
    
    @ ORR in the new value
    ORR     R3, R1
    
.Lreturn:
    POP     {R4}
    POP     {R0}
    BX      R0
