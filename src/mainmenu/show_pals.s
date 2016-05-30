

@ =============== S U B R O U T I N E =======================================


mainmenu_show_pals_maybe:               @ CODE XREF: mainmenu_show_pals0+4p
                                        @ mainmenu_show_pals1+4p

a5  = -0x18
var_14= -0x14
var_10= -0x10

    PUSH    {R4,R5,LR}
    SUB     SP, SP, #0xC
    MOVS    R4, R0
    LSLS    R4, R4, #0x18
    LSRS    R4, R4, #0x18
    MOVS    R0, #0                      @ value
    LDR     R4, vblank_handler_set
    BL      .Llinker

    MOVS    R0, #0                      @ ioreg
    MOVS    R1, #0                      @ value
    LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0xC                    @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0xA                    @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #8                      @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x18                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x1A                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x14                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x16                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x10                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    MOVS    R0, #0x12                   @ ioreg
    MOVS    R1, #0                      @ value
    @LDR     R4, lcd_io_set
    BL      .Llinker

    ADD     R1, SP, #4
    MOVS    R0, #0
    STRH    R0, [R1]
    LDR     R1, =io_dma3sad
    ADD     R0, SP, #4
    STR     R0, [R1]
    MOVS    R0, #0x6000000
    STR     R0, [R1,#4]
    LDR     R0, =0x8100C000
    STR     R0, [R1,#8]
    LDR     R0, [R1,#8]
    MOVS    R5, #0
    STR     R5, [SP,#8]
    ADD     R0, SP, #8
    STR     R0, [R1]
    MOVS    R0, #0x7000000
    STR     R0, [R1,#4]
    LDR     R0, =0x85000100
    STR     R0, [R1,#8]
    LDR     R0, [R1,#8]
    ADD     R0, SP, #4
    STRH    R5, [R0]
    STR     R0, [R1]
    LDR     R0, =0x5000002
    STR     R0, [R1,#4]
    LDR     R0, =0x810001FF
    STR     R0, [R1,#8]
    LDR     R0, [R1,#8]
    LDR     R4, boot_fade_sequence
    BL      .Llinker
    
    LDR     R0, =mainmenu_menu_pal
    MOVS    R1, #0
    MOVS    R2, #0x20 @ ' '
    LDR     R4, gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, =mainmenu_bg_pal
    MOV     R1, #0x30
    MOV     R2, #0x10
    @LDR     R4, gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, =dword_082FF0C0
    MOVS    R1, #0xF0 @ '='
    MOVS    R2, #0x20 @ ' '
    @LDR     R4, gpu_pal_apply
    BL      .Llinker
    
    LDR     R0, =mainmenu_bg_img
    MOV     R5, #6      @ ~LDR R3, #0x6000000
    LSL     R5, R5, #24 @
    MOV     R1, R5
    LDR     R4, =LZ77UnCompVram
    BL      .Llinker
    
    LDR     R0, =mainmenu_bg_map
    MOV     R1, #0xF8  @ ~LDR R1, #0xF800
    LSL     R1, R1, #8 @
    ADD     R1, R1, R5
    @LDR     R4, =LZ77UnCompVram
    BL      .Llinker
    
    MOV     R0, #1
    MOV     R1, #0
    MOV     R2, #0x1F
    MOV     R3, #0
    LDR     R4, =citgpu_show_bg
    BL      .Llinker
    
    BL      dma_task_delete_something
    
    BL      tasks_init

    BL      obj_and_aux_reset_all

    BL      gpu_pal_allocator_reset

    CMP     R4, #0
    BEQ     loc_0802F7EC

    MOVS    R0, #1
    NEGS    R0, R0
    STR     R5, [SP]                    @ a5
    MOVS    R1, #0                      @ a2
    MOVS    R2, #0x10                   @ a3
    MOVS    R3, #0                      @ a4
    BL      fade_screen
    
    B       loc_0802F7FE

loc_0802F7EC:
    
    MOVS    R0, #1
    NEGS    R0, R0
    LDR     R1, =0xFFFF
    STR     R1, [SP]                    @ a5
    MOVS    R1, #0                      @ a2
    MOVS    R2, #0x10                   @ a3
    MOVS    R3, #0                      @ a4
    BL      fade_screen


loc_0802F7FE:                           @ CODE XREF: mainmenu_show_pals_maybe+D8j
    MOVS    R0, #0
    BL      sub_080017BC

    LDR     R1, =dword_082FF0E8
    MOVS    R0, #0
    MOVS    R2, #2
    BL      bg_vram_setup

    MOVS    R0, #0
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_x_offset

    MOVS    R0, #0
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_y_offset

    MOVS    R0, #1
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_x_offset

    MOVS    R0, #1
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_y_offset

    LDR     R0, =dword_082FF038
    BL      textbox_bg_init

    BL      sub_080045B0

    LDR     R1, =0x1D5
    MOVS    R0, #0
    BL      sub_080320A4

    MOVS    R0, #0x40 @ '@'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x44 @ 'D'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x48 @ 'H'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x4A @ 'J'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x50 @ 'P'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x52 @ 'R'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set
    
    MOVS    R0, #0x54 @ 'T'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set
    
    MOVS    R0, #1
    BL      sub_0800125C
    
    LDR     R0, =sub_0802F6C8           @ value
    BL      vblank_handler_set
    
    LDR     R0, =sub_0802F6B0
    BL      set_callback2
    
    MOVS    R1, #0x3040                 @ value
    MOVS    R0, #0                      @ ioreg
    BL      lcd_io_set
    
    MOVS    R0, #0
    BL      gpu_sync_bg_show
    
    MOVS    R0, #1
    BL      gpu_sync_bg_hide
    
    LDR     R0, =sub_0802F8D8
    MOVS    R1, #0
    BL      task_add
    
    MOVS    R0, #0
    ADD     SP, SP, #0xC
    POP     {R4,R5}
    POP     {R1}
    BX      R1

@ End of function mainmenu_show_pals

@ ---------------------------------------------------------------------------
