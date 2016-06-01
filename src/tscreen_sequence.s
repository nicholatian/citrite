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

@ fix this later
.equ nop_inst, 0x46C0
.globl nop_inst

.equ bootscreen_temphook1, 0x2113
.equ bootscreen_temphook2, 0x02C9
.equ bootscreen_temphook3, 0x0209

.equ tscreen_img_vramaddr, 0x6004000
.equ tscreen_map_vramaddr, 0x600E000

.equ tscreen_ioreg_a, 0x1C84
.equ tscreen_ioreg_b, 0x0103
.equ tscreen_ioreg_c, 0x0102

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Titlescreen Loading Sequence
@ DESCRIPTION: Thumb function for loading and firing the assets for the game’s
@              titlescreen. These assets include the backdrop, Pokémon logo,
@              version logo, copyright/press start graphic, translucent smoke,
@              and shining overlay for the Pokémon logo.

.section .text
.balign 4
.thumb_func
.globl tscreen_sequence

@@ void tscreen_sequence( void )

tscreen_sequence:
    
    PUSH    {LR}
    PUSH    {R4-R6}
    SUB     SP, #0x14
    LDR     R0, =super
    MOV     R1, #0x87  @ ~LDR =0x438
    LSL     R1, R1, #3 @
    ADD     R0, R0, R1
    LDRB    R0, [R0]
    CMP     R0, #5
    BHI     .Lpart1
    LSL     R0, R0, #2
    LDR     R1, =.Ljpt
    ADD     R0, R0, R1
    LDR     R0, [R0]
    MOV     PC, R0

.section .data
.balign 4, 0

.pool

.balign 4, 0

.Ljpt:
    .word   .Lpart1
    .word   .Lgenerator
    .word   .Lpart3
    .word   .Lpart4
    .word   .Lioregs
    .word   .Lpart6

.section .text
.balign 2
.thumb

.Lpart1:
    
    MOV     R0, #0
    LDR     R4, =vblank_handler_set
    BL      .Llinker
    
    MOV     R0, #0x50
    MOV     R1, #0
    LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x52
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x54
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R1, #5 @ MOV 0x5000000
    LSL     R1, R1, #24
    MOV     R0, #0x7F  @ ~LDR =0x7FFF
    LSL     R0, R0, #8 @
    ADD     R0, #0xFF  @
    STRH    R0, [R1]
    MOV     R0, #0
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0xC
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0xA
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #8
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x18
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x1A
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x14
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x16
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x10
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x12
    MOV     R1, #0
    @LDR     R4, =lcd_io_set @ lcd_io_set
    BL      .Llinker
    
    ADD     R1, SP, #0xC
    MOV     R0, #0
    STRH    R0, [R1]
    LDR     R1, =io_dma3sad
    ADD     R0, SP, #0xC
    STR     R0, [R1]
    MOV     R0, #6      @ ~LDR 0x06000000
    LSL     R0, R0, #24 @
    STR     R0, [R1, #4]
    LDR     R0, =0x8100C000
    STR     R0, [R1, #8]
    LDR     R0, [R1, #8]
    MOV     R2, #0
    STR     R2, [SP, #0x10]
    ADD     R0, SP, #0x10
    STR     R0, [R1]
    MOV     R0, #7
    LSL     R0, R0, #24
    STR     R0, [R1, #4]
    LDR     R0, =0x85000100
    STR     R0, [R1, #8]
    LDR     R0, [R1, #8]
    ADD     R0, SP, #0xC
    STRH    R2, [R0]
    STR     R0, [R1]
    MOV     R0, #0x5   @ ~LDR 0x05000002
    LSL     R0, #24    @
    ADD     R0, R0, #2 @
    STR     R0, [R1, #4]
    LDR     R0, =0x810001FF
    STR     R0, [R1, #8]
    LDR     R0, [R1, #8]
    LDR     R4, =boot_fade_sequence
    BL      .Llinker
    
    LDR     R0, =super
    MOV     R1, #0x87 @ ~LDR 0x438
    LSL     R1, R1, #3
    ADD     R0, R0, R1
    MOV     R1, #1
    STRB    R1, [R0]
    B       .Lend

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lgenerator:
    
    LDR     R0, =titlescreen_pal
    MOV     R2, #0x1E @ ~LDR =0x1E0
    LSL     R2, R2, #4
    MOV     R1, #0
    LDR     R4, =gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, =0x8DE0644
    MOV     R6, #0x6
    LSL     R6, R6, #24
    MOV     R1, #0x48  @ ~LDR =0x06004800
    LSL     R1, R1, #8 @
    ADD     R1, R1, R6 @
    LDR     R4, =LZ77UnCompVram
    BL      .Llinker
    
    LDR     R0, =titlescreen_img
    MOV     R1, #0x40  @ ~LDR =0x06004000
    LSL     R1, R1, #8 @
    ADD     R1, R1, R6 @
    @LDR     R4, =LZ77UnCompVram
    BL      .Llinker
    
    LDR     R0, =titlescreen_map
    MOV     R1, #0xE0  @ ~LDR =0x0600E000
    LSL     R1, R1, #8 @
    ADD     R1, R1, R6 @
    @LDR     R4, =LZ77UnCompVram
    BL      .Llinker
    
    LDR     R4, =dma_task_delete_something
    BL      .Llinker
    
    LDR     R4, =tasks_init
    BL      .Llinker
    
    LDR     R4, =obj_and_aux_reset_all
    BL      .Llinker
    
    LDR     R4, =gpu_pal_allocator_reset
    BL      .Llinker
    
    @ OAM for EMERALD VERSION
    LDR     R1, =0x300301C
    MOV     R0, #9
    STRB    R0, [R1]
    LDR     R0, =0x8540000
    MOV     R6, R0 @ Save this for later similar values
    ADD     R0, R0, #0x48 @ ~LDR =0x08540048
    LDR     R4, =gpu_tile_obj_decompress_alloc_tag_and_upload_2
    BL      .Llinker
    
    @ OAM for PRESS START
    MOV     R0, R6        @ ~LDR =0x085400F0
    ADD     R0, R0, #0xF0 @
    @LDR     R4, =gpu_tile_obj_decompress_alloc_tag_and_upload_2
    BL      .Llinker
    
    @ OAM for shining glow across Pokémon Logo
    MOV     R0, #0x4F  @ ~LDR =0x0854013C
    LSL     R0, R0, #2 @
    ADD     R0, R0, R6 @
    @LDR     R4, =gpu_tile_obj_decompress_alloc_tag_and_upload_2
    BL      .Llinker
    
    @ Palette for shining glow, BE CAREFUL
    LDR     R0, =0x08DDE438
    MOV     R5, #0x10  @ ~LDR =0x100
    LSL     R5, R5, #4 @
    MOV     R1, R5 @ Save this for later
    MOV     R2, #0x20
    LDR     R4, =gpu_pal_apply
    BL      .Llinker
    
    @ Palette for PRESS START
    @ 0x08DE03C8 -> tscreen_press_start_pal
    @
    @ NOTE: Transparent colour appears solid during intro fanfare sequence
    ADD     R0, R5, R6 @ ~LDR =0x08540100
    LDR     R4, =gpu_pal_obj_alloc_tag_and_apply
    BL      .Llinker
    
    LDR     R0, =super
    MOV     R2, #0x87  @ ~LDR =0x438
    LSL     R2, R2, #3 @
    ADD     R0, R0, R2 @ add 0x438, relative to super
    MOV     R1, #2
    STRB    R1, [R0]
    B       .Lend

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lpart3:
    LDR     R0, =sub_080AAB44
    MOV     R1, #0
    LDR     R4, =task_add
    BL      .Llinker
    
    LDR     R2, =tasks
    LSL     R1, R0, #2
    ADD     R1, R1, R0
    LSL     R1, R1, #3
    ADD     R1, R1, R2
    MOV     R2, #0
    MOV     R0, #0x10  @ ~LDR =0x100
    LSL     R0, R0, #4 @
    STRH    R0, [R1,#8]
    STRH    R2, [R1,#0xA]
    MOV     R0, #0x10   @ ~LDR =0xFFF0
    LSL     R0, R0, #12 @
    SUB     R0, #0x10   @
    STRH    R0, [R1,#0xC]
    SUB     R0, #0x10
    STRH    R0, [R1,#0xE]
    LDR     R0, =super
    MOV     R1, #0x87  @ ~LDR =0x438
    LSL     R1, R1, #3 @
    ADD     R0, R0, R1
    MOV     R1, #3
    STRB    R1, [R0]
    B       .Lend

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lpart4:
    MOV     R0, #1
    NEG     R0, R0
    MOV     R1, #0x10   @ ~LDR =0xFFFF
    LSL     R1, R1, #12 @
    SUB     R1, #1      @
    STR     R1, [SP]
    MOV     R1, #1
    MOV     R2, #0x10
    MOV     R3, #0
    LDR     R4, =fade_screen
    BL      .Llinker
    
    LDR     R0, =sub_080AA780
    LDR     R4, =vblank_handler_set
    BL      .Llinker
    
    LDR     R0, =super
    MOV     R2, #0x87  @ ~LDR =0x438
    LSL     R2, R2, #3 @
    ADD     R0, R0, R2
    MOV     R1, #4
    STRB    R1, [R0]
    B       .Lend

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lioregs:
    
    MOV     R2, #0x10  @ ~LDR =0x100
    LSL     R2, R2, #4 @
    MOV     R0, #0x78
    MOV     R1, #0x50
    MOV     R3, #0
    LDR     R4, =sub_0816F2A8
    BL      .Llinker
    
    MOV     R1, #0xE3  @ ~LDR =0xE300
    LSL     R1, R1, #8 @
    MOV     R0, #0x28
    LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R5, #0x10   @ ~LDR =0xFFFF
    LSL     R5, R5, #12 @
    SUB     R5, #1      @
    MOV     R0, #0x2A
    MOV     R1, R5
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0xE0 @ ~LDR =0xE000
    LSL     R1, R1, #8
    MOV     R0, #0x2C
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x2E
    MOV     R1, R5
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x40
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x44
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x42
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x46
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0x1F  @ ~LDR =0x1F1F
    LSL     R1, R1, #8 @
    ADD     R1, #0x1F  @
    MOV     R0, #0x48
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0x3F  @ ~LDR =0x3F1F
    LSL     R1, R1, #8 @
    ADD     R1, #0x1F  @
    MOV     R0, #0x4A
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x50
    MOV     R1, #0x84
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x52
    MOV     R1, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x54
    MOV     R1, #0xC
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    @ TITLE SCREEN BACKGROUND IO REGISTER
    @ 0x1A0B -> 0x1C84
    MOV     R1, #0x1C    @ ~LDR =0x1C84
    LSL     R1, R1, #8   @
    ADD     R1, #0x84    @
    MOV     R0, #8
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    @ HIDDEN TITLE SCREEN LAYER 1 (lazy :3)
    @ 0x1B0E -> 0x0103
    MOV     R1, #0x1     @ ~LDR =0x0103
    LSL     R1, R1, #8   @
    ADD     R1, #0x3     @
    MOV     R0, #0xA
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    @ HIDDEN TITLE SCREEN LAYER 2 (lazy :3)
    @ 0x4981 -> 0x0102
    MOV     R1, #0x1   @ ~LDR =0x0102
    LSL     R1, R1, #8 @
    ADD     R1, #0x2   @
    MOV     R0, #0xC
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0xB4  @ ~LDR =0xB441
    LSL     R1, R1, #8 @
    ADD     R1, #0x41  @
    MOV     R0, #0
    @LDR     R4, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0x19  @ ~LDR =0x019D
    LSL     R1, R1, #4 @
    ADD     R1, #0xD   @
    LDRH    R0, =0x019D
    LDR     R4, =song_play_and_auto_config
    BL      .Llinker
    
    LDR     R0, =super
    MOV     R1, #0x87  @ ~LDR =0x438
    LSL     R1, R1, #3 @
    ADD     R0, R0, R1
    MOV     R1, #5
    STRB    R1, [R0]
    B       .Lend

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lpart6:
    LDR     R4, =fade_and_return_progress_probably
    BL      .Llinker
    
    CMP     R5, #0
    BNE     .Lend
    MOV     R0, #0
    LDR     R4, =c3_tutorial_oak_boy_girl
    BL      .Llinker
    
    STR     R5, [SP]
    MOV     R0, #4
    STR     R0, [SP,#4]
    MOV     R0, #1
    STR     R0, [SP,#8]
    MOV     R0, #0
    MOV     R1, #0xA0
    MOV     R2, #4
    MOV     R3, #4
    LDR     R4, =sub_080BA384
    BL      .Llinker
    
    LDR     R0, =sub_080AAB2C
    LDR     R4, =set_callback2
    BL      .Llinker

.Lend:
    
    ADD     SP, SP, #0x14
    POP     {R4-R6}
    POP     {R0}
    BX      R0

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Llinker:
    BX      R4
