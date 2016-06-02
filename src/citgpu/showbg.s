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

.file "citgpu/showbg.s"
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
    
    PUSH    {LR}
    PUSH    {R4,R5,R8-R11}
    
    @ return immediately if any arguments are out of bounds
    CMP     R0, #3
    BGT     .Lreturn
    
    CMP     R1, #3
    BGT     .Lreturn
    
    CMP     R2, #0x1F
    BGT     .Lreturn
    
    CMP     R3, #1
    BGT     .Lreturn
    
    @ save our arguments for later
    MOV     R8, R0
    MOV     R9, R1
    MOV     R10, R2
    MOV     R11, R3
    
    @ piece together BG?CNT
    @ note that the BGID is already ready to go
    LDR     R1, =citgpu_get_priority
    BL      .Llinker
    
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

.Lreturn:
    
    POP     {R4-R5,R8-R11}
    POP     {R0}
    BX      R0

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Llinker:
    
    BX      R1
