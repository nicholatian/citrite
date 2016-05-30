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

.file "tscreen_sequence.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Citrite BG show routine
@ DESCRIPTION: Takes a BGID, tileset VRAM offset, and tilemap VRAM offset and
@              updates the BG?CNT registers to reflect those IDs/offsets.
@              tileset and tilemap offsets should be as described in GBATEK.

.section .text
.balign 4
.thumb_func
.globl citgpu_show_bg

@@ void citgpu_show_bg( u8 bgid, u8 img_offs, u8 map_offs, bool is8bit )

citgpu_show_bg:
    
    PUSH    {R4-R5,R8-R11,LR}
    
    @ return immediately if any arguments are out of bounds
    CMP     R0, #3
    BGT     .Lshowbg_return
    
    CMP     R1, #3
    BGT     .Lshowbg_return
    
    CMP     R2, #0x1F
    BGT     .Lshowbg_return
    
    CMP     R3, #1
    BGT     .Lshowbg_return
    
    @ save our arguments for later
    MOV     R8, R0
    MOV     R9, R1
    MOV     R10, R2
    MOV     R11, R3
    
    @ piece together BG?CNT
    @ note that the BGID is already ready to go
    BL      citgpu_get_priority
    MOV     R1, R9
    LSL     R1, R1, #2
    ORR     R0, R0, R1
    MOV     R1, R10
    LSL     R1, R1, #8
    ORR     R0, R0, R1
    MOV     R1, R11
    LSL     R1, R1, #7
    ORR     R4, R0, R1
    
    @ Get the appropriate I/O register
    MOV     R1, #0x4    @ ~LDR R3, #0x4000000
    LSL     R1, R1, #24 @
    LSL     R0, R0, #1
    ADD     R1, R1, R0
    
    @ Store the value :)
    STR     R4, [R5,#8] @ adjusted by 8 to access BG?CNT

.Lshowbg_return:
    
    POP     {R4-R5,R8-R11}
    POP     {R0}
    BX      R0

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
