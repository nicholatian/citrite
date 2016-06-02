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

.file "citgpu/get_priority.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Citrite BG priority getter
@ DESCRIPTION: This subroutine takes a BGID and returns a priority based on it.
@              The higher the BGID, the higher the effective priority it will
@              have.

.section .text
.balign 4
.thumb_func
.globl citgpu_get_priority

@@ u32 citgpu_get_priority( u32 bgid )

citgpu_get_priority:
    
    PUSH    {LR}
    
    @ return immediately if any arguments are out of bounds
    CMP     R0, #3
    BGT     .Lgetp_return
    
    BEQ     .Lset_0
    
    CMP     R0, #2
    BEQ     .Lset_1
    
    CMP     R0, #1
    BEQ     .Lset_2
    
    BLT     .Lset_3

.Lset_0:
    
    MOV     R0, #0
    B       .Lgetp_return

.Lset_1:
    
    MOV     R0, #1
    B       .Lgetp_return

.Lset_2:
    
    MOV     R0, #2
    B       .Lgetp_return

.Lset_3:
    
    MOV     R0, #3

.Lgetp_return:
    
    POP     {R1}
    BX      R1
