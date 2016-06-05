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

.file "pokemenu/switch.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "gf/bpee.s"

@ ============================ S U B R O U T I N E ============================
@
@ TITLE:       Pokémenu Graphics Loader
@ DESCRIPTION: This routine is comprised of a switch that loads different parts
@              of the graphics for the Pokémenu.

.section .text
.balign 4
.thumb_func
.globl pokemenu_switch

@@ bool pokemenu_switch( void )

pokemenu_switch:
    
    PUSH    {R4-R5,LR}
    SUB     SP, SP, #4
    LDR     R1, =super
    MOV     R2, #0x87  @ ~LDR R2, #0x438
    LSL     R2, R2, #3 @
    ADD     R0, R1, R2
    LDRB    R0, [R0]
    MOV     R2, R1
    CMP     R0, #0x16
    BLS     .Lstartjpt
    
    B       .Lcase_default

.Lstartjpt:
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
    
    .word .Lcase0
    .word .Lcase1
    .word .Lcase2
    .word .Lcase3
    .word .Lcase4
    .word .Lcase5
    .word .Lcase6
    .word .Lcase7
    .word .Lcase8
    .word .Lcase9
    .word .Lcase10
    .word .Lcase11
    .word .Lcase12
    .word .Lcase13
    .word .Lcase14
    .word .Lcase15
    .word .Lcase16
    .word .Lcase17
    .word .Lcase18
    .word .Lcase19
    .word .Lcase20
    .word .Lcase21
    .word .Lcase22

@ -----------------------------------------------------------------------------

.section .text
.balign 2
.thumb

.Lcase0:
    
    LDR     R4, =vblank_hblank_handler_set_zero
    BL      .Llinker
    
    LDR     R4, =clear_io_regs_maybe
    BL      .Llinker
    
    LDR     R4, =tilemaps_sync_none
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase1:
    
    LDR     R4, =dma_task_delete_something
    BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase2:
    
    LDR     R4, =boot_fade_sequence
    BL      .Llinker
    
    LDR     R2, =0x2037FD4
    LDRB    R0, [R2,#8]
    MOV     R1, #0x80
    ORR     R0, R1
    STRB    R0, [R2,#8]
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase3:
    
    LDR     R4, =obj_and_aux_reset_all
    BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase4:
    
    LDR     R4, =gpu_pal_allocator_reset
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase5:
    
    @LDR     R4, =checkbyte_from_52stack_etc
    @BL      .Llinker
    
    CMP     R0, #0
    BEQ     .Linit_loadsuper
    
    B       .Lloadsuper

.Linit_loadsuper:
    
    LDR     R4, =tasks_init
    BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase6:
    
    LDR     R4, =pokeparty_enum_sth
    BL      .Llinker
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase7:
    
    @LDR     R4, =pokemenu_setup_gfx
    @BL      .Llinker
    
    CMP     R0, #0
    BNE     .Llastitem_0x218
    
    @LDR     R4, =pokemenu_fadescr_addtask
    @BL      .Llinker
    
    MOV     R0, #1
    B       .Lreturn

.Llastitem_0x218:
    LDR     R0, =(last_used_item_maybe+0x48)
    LDR     R0, [R0]
    MOV     R1, #0x43  @ ~LDR 0x218
    LSL     R1, R1, #3 @
    ADD     R0, R0, R1
    MOV     R1, #0
    STRH    R1, [R0]
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase8:
    
    @LDR     R4, =pokemenu_decompress_stuff
    @BL      .Llinker
    
    CMP     R0, #0
    BNE     .Lsuper_0x438
    
    B       .Lsetret_false

.Lsuper_0x438:
    
    LDR     R1, =super
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R1, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase9:
    
    LDR     R0, =0x203CEC8
    LDRB    R0, [R0,#8]
    LSL     R0, R0, #0x1A
    LSR     R0, R0, #0x1E
    @LDR     R4, =pokemenu_textbox_init
    @BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase10:
    
    LDR     R0, =0x203CEC8
    LDRB    R0, [R0,#8]
    LSL     R0, R0, #0x1A
    LSR     R0, R0, #0x1E
    @LDR     R4, =pokemenu_textbox_sth
    @BL      .Llinker
    
    B       .Llastitem_0x218

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase11:
    
    @LDR     R4, =pokemenu_load_item_minisprite
    @BL      .Llinker
    
    B       .Lsuper_0x438

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase12:
    
    @LDR     R4, =pokemenu_load_pokeball_sidebtn
    @BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.Lcase13:
    
    @LDR     R4, =pokemenu_load_status_badges
    @BL      .Llinker
    
    B       .Lsuper_0x438

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase14:
    
    @LDR     R4, =pokemenu_load_sprpals
    @BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.Lcase15:
    
    @LDR     R4, =pokemenu_get_pokedata_lastitem
    @BL      .Llinker
    
    CMP     R0, #0
    BNE     .Llastitem_0x218
    
    B       .Lsetret_false

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase16:
    
    @LDR     R4, =sub_081B0DA0
    @BL      .Llinker
    
    CMP     R0, #0
    BEQ     .Lsetret_false
    
    B       .Llastitem_0x218

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase17:
    
    @LDR     R4, =sub_081B0F28
    @BL      .Llinker
    
    B       .Lsuper_0x438

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase18:
    
    LDR     R0, =(last_used_item_maybe+0x48)
    LDR     R0, [R0]
    LDRB    R0, [R0,#8] @ this is a bool value
    @LDR     R4, =sub_081B2428
    @BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase19:
    
    MOV     R0, #0x87  @ ~LDR R0, #0x438
    LSL     R0, R0, #3 @
    ADD     R1, R2, R0
    B       .Lincr_superval

@ -----------------------------------------------------------------------------

.Lcase20:
    
    LDR     R5, =(last_used_item_maybe+0x48)
    LDR     R0, [R5]
    LDR     R0, [R0]
    MOV     R1, #0
    LDR     R4, =task_add
    BL      .Llinker
    
    LDR     R0, [R5]
    LDRH    R0, [R0,#10]
    LSR     R0, R0, #2
    LDR     R4, =sub_081B3054
    BL      .Llinker
    
    B       .Lloadsuper

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase21:
    
    MOV     R0, #1
    NEG     R0, R0
    MOV     R1, #0x10
    MOV     R2, #0
    @LDR     R4, =sub_080A2A20
    BL      .Llinker
    
    LDR     R2, =0x2037FD4
    LDRB    R1, [R2,#8]
    MOV     R0, #0x7F
    AND     R0, R1
    STRB    R0, [R2,#8]
    B       .Lsuper_0x438

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase22:
    
    MOV     R0, #1
    NEG     R0, R0
    MOV     R1, #0
    STR     R1, [SP]
    MOV     R2, #0x10
    MOV     R3, #0
    LDR     R4, =fade_screen
    BL      .Llinker

.Lloadsuper:
    
    LDR     R1, =super
    MOV     R2, #0x87  @ ~LDR R2, #0x438
    LSL     R2, R2, #3 @
    ADD     R1, R1, R2

.Lincr_superval:
    
    LDRB    R0, [R1]
    ADD     R0, #1
    STRB    R0, [R1]
    B       .Lsetret_false

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lcase_default:
    
    @LDR     R0, =sub_081B01CC
    LDR     R4, =vblank_handler_set
    BL      .Llinker
    
    @LDR     R0, =sub_081B01B0
    LDR     R4, =set_callback2
    BL      .Llinker
    
    MOV     R0, #1
    B       .Lreturn

.Lsetret_false:
    
    MOV     R0, #0

.Lreturn:
    
    ADD     SP, SP, #4
    POP     {R4-R5}
    POP     {R1}
    BX      R1

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Llinker:
    
    BX      R4

@ End of function pokemenu_switch

@ ---------------------------------------------------------------------------
