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

.file "optsmenu/switch.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ =========================== S U B R O U T I N E =========================== @
@
@ TITLE:       Options menu loading case-switch
@ DESCRIPTION: 

.section .text
.balign 4
.thumb_func
.globl optsmenu_switch

optsmenu_switch:
    
    PUSH    {R4-R8,LR}
    MOV     R7, R8
    PUSH    {R7}
    SUB     SP, SP, #0xC
    LDR     R1, =super
    MOV     R2, #0x438
    ADD     R0, R1, R2
    LDRB    R0, [R0]
    MOV     R2, R1
    CMP     R0, #0xB
    BHI     .Lcase0
    
    @ Jump table switch
    LSL     R0, R0, #2
    LDR     R1, =.Ljpt
    ADD     R0, R0, R1
    LDR     R0, [R0]
    MOV     PC, R0

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.Ljpt:
    
    .word .Lcase0                       @ jumptable case 0
    .word .Lcase1                       @ jumptable case 1
    .word .Lcase2                       @ jumptable case 2
    .word .Lload_rbox_tiles             @ jumptable case 3
    .word .Lcase4                       @ jumptable case 4
    .word .Lcase5                       @ jumptable case 5
    .word .Lcase6                       @ jumptable case 6
    .word .Lcase7                       @ jumptable case 7
    .word .Lcase8                       @ jumptable case 8
    .word .Lcase9                       @ jumptable case 9
    .word .Lcase10                      @ jumptable case 10
    .word .Lcleanup                     @ jumptable case 11

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase0:
    
    MOV     R0, #0
    LDR     R8, =vblank_handler_set
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x438
    ADD     R1, R1, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase1:
    
    MOV     R3, #0x6    @ ~LDR R3, =0x6000000
    LSL     R3, R3, #24 @
    MOV     R4, #0x18   @ ~LDR R4, =0x18000
    LSL     R4, R4, #12 @
    ADD     R1, SP, #8
    MOV     R8, R1
    ADD     R2, SP, #4
    MOV     R6, #0
    LDR     R1, =io_dma3sad
    MOV     R5, #0x1000
    MOV     R0, #0x81   @ ~LDR R0, =0x81000000
    LSL     R0, R0, #24 @
    MOV     R7, #0x80  @ ~LDR R7, =0x800
    LSL     R7, R7, #4 @
    ADD     R7, R7, R0
    MOV     R12, R0

.Lcase1_loop:
    
    STRH    R6, [R2]
    ADD     R0, SP, #4
    STR     R0, [R1]
    STR     R3, [R1,#4]
    STR     R7, [R1,#8]
    LDR     R0, [R1,#8]
    ADD     R3, R3, R5
    SUB     R4, R4, R5
    CMP     R4, R5
    BHI     .Lcase1_loop
    
    STRH    R6, [R2]
    ADD     R2, SP, #4
    STR     R2, [R1]
    STR     R3, [R1,#4]
    LSR     R0, R4, #1
    MOV     R2, R12
    ORR     R0, R2
    STR     R0, [R1,#8]
    LDR     R0, [R1,#8]
    MOV     R0, #0x7    @ ~LDR R0, =0x7000000
    LSL     R0, R0, #24 @
    MOV     R3, #0x4   @ ~LDR R3, =0x400
    LSL     R3, R3, #8 @
    MOV     R4, #0
    STR     R4, [SP,#8]
    LDR     R2, =io_dma3sad
    MOV     R1, R8
    STR     R1, [R2]
    STR     R0, [R2,#4]
    LSR     R0, R3, #2
    MOV     R1, #0x85   @ ~LDR R1, =0x85000000
    LSL     R1, R1, #24 @
    ORR     R0, R1
    STR     R0, [R2,#8]
    LDR     R0, [R2,#8]
    MOV     R1, #0x5    @ ~LDR R1, =0x5000000
    LSL     R1, R1, #24 @
    ADD     R0, SP, #4
    STRH    R4, [R0]
    STR     R0, [R2]
    STR     R1, [R2,#4]
    LSR     R3, R3, #1
    MOV     R0, #0x81   @ ~LDR R0, =0x81000000
    LSL     R0, R0, #24 @
    ORR     R3, R0
    STR     R3, [R2,#8]
    LDR     R0, [R2,#8]
    MOV     R0, #0                      @ ioreg
    MOV     R1, #0                      @ value
    LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0
    LDR     R8, =sub_080017BC
    BL      .Llinker
    
    LDR     R1, =0x855C698
    MOV     R0, #0
    MOV     R2, #2
    LDR     R8, =bg_vram_setup
    BL      .Llinker
    
    MOV     R0, #0
    MOV     R1, #0
    MOV     R2, #0
    LDR     R8, =bgid_mod_x_offset
    BL      .Llinker
    
    MOV     R0, #1
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_x_offset
    BL      .Llinker
    
    MOV     R0, #2
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_x_offset
    BL      .Llinker
    
    MOV     R0, #3
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_x_offset
    BL      .Llinker
    
    MOV     R0, #0
    MOV     R1, #0
    MOV     R2, #0
    LDR     R8, =bgid_mod_y_offset
    BL      .Llinker
    
    MOV     R0, #1
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_y_offset
    BL      .Llinker
    
    MOV     R0, #2
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_y_offset
    BL      .Llinker
    
    MOV     R0, #3
    MOV     R1, #0
    MOV     R2, #0
    @LDR     R8, =bgid_mod_y_offset
    BL      .Llinker
    
    LDR     R0, =0x855C680
    LDR     R8, =textbox_bg_init
    BL      .Llinker
    
    LDR     R8, =sub_080045B0
    BL      .Llinker
    
    MOV     R0, #0x40 @ '@'             @ ioreg
    MOV     R1, #0                      @ value
    LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x44 @ 'D'             @ ioreg
    MOV     R1, #0                      @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x48 @ 'H'             @ ioreg
    MOV     R1, #1                      @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x4A @ 'J'             @ ioreg
    MOV     R1, #0x23 @ '#'             @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x50 @ 'P'             @ ioreg
    MOV     R1, #0xC1 @ '-'             @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x52 @ 'R'             @ ioreg
    MOV     R1, #0                      @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0x54 @ 'T'             @ ioreg
    MOV     R1, #4                      @ value
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R1, #0x3040                 @ value
    MOV     R0, #0                      @ ioreg
    @LDR     R8, =lcd_io_set
    BL      .Llinker
    
    MOV     R0, #0
    LDR     R8, =gpu_sync_bg_show
    BL      .Llinker
    
    MOV     R0, #1
    @LDR     R8, =gpu_sync_bg_show
    BL      .Llinker
    
    B       .Lincr_supertracker

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase2:
    
    LDR     R8, =boot_fade_sequence
    BL      .Llinker
    
    LDR     R8, =dma_task_delete_something
    BL      .Llinker
    
    LDR     R8, =tasks_init
    BL      .Llinker
    
    LDR     R8, =obj_and_aux_reset_all
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lload_rbox_tiles:
    
    LDR     R0, =dword_03005D90
    LDR     R0, [R0]
    LDRB    R0, [R0,#0x14]
    LSRS    R0, R0, #3
    LDR     R8, =load_rbox_tiles_addr
    BL      .Llinker
    
    LDR     R1, [R0]
    MOVS    R2, #0x12  @ ~LDR R2, =0x120
    LSL     R2, R2, #4 @
    MOVS    R3, #0xD1  @ ~LDR R3, =0x1A2
    LSL     R3, R3, #1 @
    MOVS    R0, #1                      @ DING DING DING
    LDR     R8, =gpu_copy_to_tileset
    BL      .Llinker
    
    B       .Lincr_supertracker

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase4:
    
    LDR     R0, =pal_green_yellow_gradient
    MOVS    R1, #0
    MOVS    R2, #2
    LDR     R8, =gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, [R0,#4]
    MOVS    R1, #0x70
    MOVS    R2, #0x20
    @LDR     R8, =gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, =0x3005D90
    LDR     R0, [R0]
    LDRB    R0, [R0,#0x14]
    LSRS    R0, R0, #3
    LDR     R8, =load_rbox_tiles_addr
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADDS    R1, R1, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase5:
    
    LDR     R0, =optsmenu_special_text_pal
    MOVS    R1, #0x10
    MOVS    R2, #0x20
    LDR     R8, =gpu_pal_apply
    BL      .Llinker
    
    B       .Lincr_supertracker

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase6:
    
    MOVS    R0, #0
    LDR     R8, =enable_rbox
    BL      .Llinker
    
    LDR     R8, =optsmenu_tilemap_load_sth2
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADDS    R1, R1, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase7:
    
    MOVS    R0, #0x438 @ jumptable case 7
    ADDS    R1, R2, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.Lcase8:
    
    MOVS    R0, #1
    LDR     R8, =enable_rbox
    BL      .Llinker
    
    LDR     R8, =optsmenu_tilemap_load_sth
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADDS    R1, R1, R2
    LDRB    R0, [R1]
    ADDS    R0, #1
    STRB    R0, [R1]

.Lcase9:
    
    LDR     R8, =optsmenu_tilemap_sth
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADDS    R1, R1, R0
    B       .Lincr_counter

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase10:
    
    LDR     R0, =sub_080BA83C
    MOVS    R1, #0
    LDR     R8, =task_add
    BL      .Llinker
    
    LSLS    R0, R0, #0x18
    LSRS    R0, R0, #0x18
    LDR     R1, =tasks
    LSLS    R4, R0, #2
    ADDS    R4, R4, R0
    LSLS    R4, R4, #3
    ADDS    R4, R4, R1
    MOVS    R0, #0
    STRH    R0, [R4,#8]
    LDR     R0, =0x3005D90
    LDR     R2, [R0]
    LDRB    R0, [R2,#0x14]
    LSLS    R0, R0, #0x1D
    LSRS    R0, R0, #0x1D
    STRH    R0, [R4,#0xA]
    LDRB    R1, [R2,#0x15]
    LSLS    R1, R1, #0x1D
    LSRS    R1, R1, #0x1F
    STRH    R1, [R4,#0xC]
    LDRB    R1, [R2,#0x15]
    LSLS    R1, R1, #0x1E
    LSRS    R1, R1, #0x1F
    STRH    R1, [R4,#0xE]
    LDRB    R1, [R2,#0x15]
    LSLS    R1, R1, #0x1F
    LSRS    R1, R1, #0x1F
    STRH    R1, [R4,#0x10]
    LDRB    R1, [R2,#0x13]
    STRH    R1, [R4,#0x12]
    LDRB    R1, [R2,#0x14]
    LSRS    R1, R1, #3
    STRH    R1, [R4,#0x14]
    LDR     R8, =optsmenu_loadtext_textspeed
    BL      .Llinker
    
    LDRB    R0, [R4,#0xC]
    LDR     R8, =optsmenu_loadtext_battlescene
    BL      .Llinker
    
    LDRB    R0, [R4,#0xE]
    LDR     R8, =optsmenu_loadtext_battlestyle
    BL      .Llinker
    
    LDRB    R0, [R4,#0x10]
    LDR     R8, =optsmenu_loadtext_sound
    BL      .Llinker
    
    LDRB    R0, [R4,#0x12]
    LDR     R8, =optsmenu_loadtext_buttons
    BL      .Llinker
    
    LDRB    R0, [R4,#0x14]
    LDR     R8, =optsmenu_loadtext_menustyle
    BL      .Llinker
    
    LDRB    R0, [R4,#8]
    LDR     R8, =optsmenu_load_highlight_overlay
    BL      .Llinker
    
    MOVS    R0, #1                      @ a1
    MOVS    R1, #3                      @ vram_offs
    LDR     R8, =rboxid_to_vram

.Lincr_supertracker:
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR =0x438
    LSL     R0, R0, #3 @
    ADDS    R1, R1, R2

.Lincr_counter:
    
    LDRB    R0, [R1]
    ADDS    R0, #1
    STRB    R0, [R1]
    B       .Lreturn

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcleanup:
    
    MOVS    R0, #1
    NEG     R0, R0
    MOVS    R1, #0                      @ a2
    STR     R1, [SP]                    @ a5
    MOVS    R2, #0x10                   @ a3
    MOVS    R3, #0                      @ a4
    LDR     R8, =fade_screen
    BL      .Llinker
    
    LDR     R0, =optsmenu_load_vblanker
    LDR     R8, =vblank_handler_set
    BL      .Llinker
    
    LDR     R0, =optsmenu_load_callback
    LDR     R8, =set_callback2
    BL      .Llinker

.Lreturn:
    
    ADD     SP, SP, #0xC
    POP     {R3}
    MOV     R8, R3
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

@ End of function optsmenu_switch

@ -----------------------------------------------------------------------------
