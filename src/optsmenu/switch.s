@ =============== S U B R O U T I N E =======================================


optsmenu_switch:                        @ DATA XREF: sub_0803027C+1EAo
                                        @ sub_0803027C:off_08030474o
                                        @ sub_0809FD20+24o ROM:off_0809FD58o

a5  = -0x24
var_20= -0x20
var_1C= -0x1C

    PUSH    {R4-R7,LR}
    MOV     R7, R8
    PUSH    {R7}
    SUB     SP, SP, #0xC
    LDR     R1, =super
    MOVS    R2, #0x438
    ADDS    R0, R1, R2
    LDRB    R0, [R0]
    MOVS    R2, R1
    CMP     R0, #0xB                    @ switch 12 cases
    BHI     loc_080BA538                @ jumptable 080BA4FC default case

    LSLS    R0, R0, #2
    LDR     R1, =jpt_80BA4FC
    ADDS    R0, R0, R1
    LDR     R0, [R0]
    MOV     PC, R0                      @ switch jump

@ ---------------------------------------------------------------------------
    .align 4
off_080BA500:.long super                @ DATA XREF: optsmenu_switch+8r
off_080BA504:.long jpt_80BA4FC          @ DATA XREF: optsmenu_switch+1Ar
jpt_80BA4FC:.long loc_080BA538          @ DATA XREF: optsmenu_switch+1Ao
                                        @ optsmenu_switch:off_080BA504o
                                        @ jump table for switch statement
    .long loc_080BA54C                  @ jumptable 080BA4FC case 1
    .long loc_080BA69C                  @ jumptable 080BA4FC case 2
    .long load_rbox_tiles               @ jumptable 080BA4FC case 3
    .long loc_080BA6E0                  @ jumptable 080BA4FC case 4
    .long loc_080BA718                  @ jumptable 080BA4FC case 5
    .long loc_080BA728                  @ jumptable 080BA4FC case 6
    .long case7                         @ jumptable 080BA4FC case 7
    .long case8                         @ jumptable 080BA4FC case 8
    .long case9                         @ jumptable 080BA4FC case 9
    .long case10                        @ jumptable 080BA4FC case 10
    .long cleanup                       @ jumptable 080BA4FC case 11
@ ---------------------------------------------------------------------------

loc_080BA538:                           @ CODE XREF: optsmenu_switch+16j
                                        @ optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch:jpt_80BA4FCo
    MOVS    R0, #0                      @ jumptable 080BA4FC default case
    BL      vblank_handler_set

    LDR     R1, =super
    MOVS    R0, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R0
    B       incr_counter

@ ---------------------------------------------------------------------------
off_080BA548:.long super                @ DATA XREF: optsmenu_switch+62r
@ ---------------------------------------------------------------------------

loc_080BA54C:                           @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+30o
    MOVS    R3, #0x6000000              @ jumptable 080BA4FC case 1
    MOVS    R4, #0x18000
    ADD     R1, SP, #0x24+var_1C
    MOV     R8, R1
    ADD     R2, SP, #0x24+var_20
    MOVS    R6, #0
    LDR     R1, =io_dma3sad
    MOVS    R5, #0x1000
    LDR     R7, =0x81000800
    MOVS    R0, #0x81000000
    MOV     R12, R0


loc_080BA56A:                           @ CODE XREF: optsmenu_switch+A0j
    STRH    R6, [R2]
    ADD     R0, SP, #0x24+var_20
    STR     R0, [R1]
    STR     R3, [R1,#(io_dma3dad - 0x40000D4)]
    STR     R7, [R1,#(io_dma3cnt_l - 0x40000D4)]
    LDR     R0, [R1,#(io_dma3cnt_l - 0x40000D4)]
    ADDS    R3, R3, R5
    SUBS    R4, R4, R5
    CMP     R4, R5
    BHI     loc_080BA56A

    STRH    R6, [R2]
    ADD     R2, SP, #0x24+var_20
    STR     R2, [R1]
    STR     R3, [R1,#(io_dma3dad - 0x40000D4)]
    LSRS    R0, R4, #1
    MOV     R2, R12
    ORRS    R0, R2
    STR     R0, [R1,#(io_dma3cnt_l - 0x40000D4)]
    LDR     R0, [R1,#(io_dma3cnt_l - 0x40000D4)]
    MOVS    R0, #0x7000000
    MOVS    R3, #0x400
    MOVS    R4, #0
    STR     R4, [SP,#0x24+var_1C]
    LDR     R2, =io_dma3sad
    MOV     R1, R8
    STR     R1, [R2]
    STR     R0, [R2,#(io_dma3dad - 0x40000D4)]
    LSRS    R0, R3, #2
    MOVS    R1, #0x85000000
    ORRS    R0, R1
    STR     R0, [R2,#(io_dma3cnt_l - 0x40000D4)]
    LDR     R0, [R2,#(io_dma3cnt_l - 0x40000D4)]
    MOVS    R1, #0x5000000
    ADD     R0, SP, #0x24+var_20
    STRH    R4, [R0]
    STR     R0, [R2]
    STR     R1, [R2,#(io_dma3dad - 0x40000D4)]
    LSRS    R3, R3, #1
    MOVS    R0, #0x81000000
    ORRS    R3, R0
    STR     R3, [R2,#(io_dma3cnt_l - 0x40000D4)]
    LDR     R0, [R2,#(io_dma3cnt_l - 0x40000D4)]
    MOVS    R0, #0                      @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0
    BL      sub_080017BC

    LDR     R1, =dword_0855C698
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

    MOVS    R0, #2
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_x_offset

    MOVS    R0, #2
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_y_offset

    MOVS    R0, #3
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_x_offset

    MOVS    R0, #3
    MOVS    R1, #0
    MOVS    R2, #0
    BL      bgid_mod_y_offset

    LDR     R0, =dword_0855C680
    BL      textbox_bg_init

    BL      sub_080045B0

    MOVS    R0, #0x40 @ '@'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x44 @ 'D'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x48 @ 'H'             @ ioreg
    MOVS    R1, #1                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x4A @ 'J'             @ ioreg
    MOVS    R1, #0x23 @ '#'             @ value
    BL      lcd_io_set

    MOVS    R0, #0x50 @ 'P'             @ ioreg
    MOVS    R1, #0xC1 @ '-'             @ value
    BL      lcd_io_set

    MOVS    R0, #0x52 @ 'R'             @ ioreg
    MOVS    R1, #0                      @ value
    BL      lcd_io_set

    MOVS    R0, #0x54 @ 'T'             @ ioreg
    MOVS    R1, #4                      @ value
    BL      lcd_io_set

    MOVS    R1, #0x3040                 @ value
    MOVS    R0, #0                      @ ioreg
    BL      lcd_io_set

    MOVS    R0, #0
    BL      gpu_sync_bg_show

    MOVS    R0, #1
    BL      gpu_sync_bg_show

    B       incr_supertracker

@ ---------------------------------------------------------------------------
    .align 4
off_080BA68C:.long io_dma3sad           @ DATA XREF: optsmenu_switch+80r
                                        @ optsmenu_switch+C0r
dword_080BA690:.long 0x81000800         @ DATA XREF: optsmenu_switch+86r
off_080BA694:.long dword_0855C698       @ DATA XREF: optsmenu_switch+FAr
off_080BA698:.long dword_0855C680       @ DATA XREF: optsmenu_switch+154r
@ ---------------------------------------------------------------------------

loc_080BA69C:                           @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+34o
    BL      boot_fade_sequence          @ jumptable 080BA4FC case 2

    BL      dma_task_delete_something

    BL      tasks_init

    BL      obj_and_aux_reset_all

    LDR     R1, =super
    MOVS    R0, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R0
    B       incr_counter

@ ---------------------------------------------------------------------------
    .align 4
off_080BA6B8:.long super                @ DATA XREF: optsmenu_switch+1D0r
@ ---------------------------------------------------------------------------

load_rbox_tiles:                        @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+38o
    LDR     R0, =dword_03005D90         @ jumptable 080BA4FC case 3
    LDR     R0, [R0]
    LDRB    R0, [R0,#0x14]
    LSRS    R0, R0, #3
    BL      load_rbox_tiles_addr

    LDR     R1, [R0]
    MOVS    R2, #0x120
    MOVS    R3, #0x1A2
    MOVS    R0, #1                      @ DING DING DING
    BL      gpu_copy_to_tileset

    B       incr_supertracker

@ ---------------------------------------------------------------------------
    .align 4
off_080BA6DC:.long dword_03005D90       @ DATA XREF: optsmenu_switch:load_rbox_tilesr
@ ---------------------------------------------------------------------------

loc_080BA6E0:                           @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+3Co
    LDR     R0, =pal_green_yellow_gradient @ jumptable 080BA4FC case 4
    MOVS    R1, #0
    MOVS    R2, #2
    BL      gpu_pal_apply

    LDR     R0, =dword_03005D90
    LDR     R0, [R0]
    LDRB    R0, [R0,#0x14]
    LSRS    R0, R0, #3
    BL      load_rbox_tiles_addr

    LDR     R0, [R0,#4]
    MOVS    R1, #0x70 @ 'p'
    MOVS    R2, #0x20 @ ' '
    BL      gpu_pal_apply

    LDR     R1, =super
    MOVS    R0, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R0
    B       incr_counter

@ ---------------------------------------------------------------------------
    .align 4
off_080BA70C:.long pal_green_yellow_gradient @ DATA XREF: optsmenu_switch:loc_080BA6E0r
off_080BA710:.long dword_03005D90       @ DATA XREF: optsmenu_switch+20Er
off_080BA714:.long super                @ DATA XREF: optsmenu_switch+224r
@ ---------------------------------------------------------------------------

loc_080BA718:                           @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+40o
    LDR     R0, =optsmenu_special_text_pal @ jumptable 080BA4FC case 5
    MOVS    R1, #0x10
    MOVS    R2, #0x20 @ ' '
    BL      gpu_pal_apply

    B       incr_supertracker

@ ---------------------------------------------------------------------------
off_080BA724:.long optsmenu_special_text_pal @ DATA XREF: optsmenu_switch:loc_080BA718r
@ ---------------------------------------------------------------------------

loc_080BA728:                           @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+44o
    MOVS    R0, #0                      @ jumptable 080BA4FC case 6
    BL      enable_rbox

    BL      optsmenu_tilemap_load_sth2

    LDR     R1, =super
    MOVS    R0, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R0
    B       incr_counter

@ ---------------------------------------------------------------------------
off_080BA73C:.long super                @ DATA XREF: optsmenu_switch+256r
@ ---------------------------------------------------------------------------

case7:                                  @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+48o
    MOVS    R0, #superstate.multi_purpose_state_tracker @ jumptable 080BA4FC case 7
    ADDS    R1, R2, R0
    B       incr_counter

@ ---------------------------------------------------------------------------

case8:                                  @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+4Co
    MOVS    R0, #1                      @ jumptable 080BA4FC case 8
    BL      enable_rbox

    BL      optsmenu_tilemap_load_sth

    LDR     R1, =super
    MOVS    R2, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R2
    LDRB    R0, [R1]
    ADDS    R0, #1
    STRB    R0, [R1]


case9:                                  @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+50o
    BL      optsmenu_tilemap_sth        @ jumptable 080BA4FC case 9

    LDR     R1, =super
    MOVS    R0, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R0
    B       incr_counter

@ ---------------------------------------------------------------------------
    .align 4
off_080BA770:.long super                @ DATA XREF: optsmenu_switch+276r
                                        @ optsmenu_switch+288r
@ ---------------------------------------------------------------------------

case10:                                 @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+54o
    LDR     R0, =(sub_080BA83C+1)       @ jumptable 080BA4FC case 10
    MOVS    R1, #0
    BL      task_add

    LSLS    R0, R0, #0x18
    LSRS    R0, R0, #0x18
    LDR     R1, =tasks
    LSLS    R4, R0, #2
    ADDS    R4, R4, R0
    LSLS    R4, R4, #3
    ADDS    R4, R4, R1
    MOVS    R0, #0
    STRH    R0, [R4,#8]
    LDR     R0, =dword_03005D90
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
    BL      optsmenu_loadtext_textspeed

    LDRB    R0, [R4,#0xC]
    BL      optsmenu_loadtext_battlescene

    LDRB    R0, [R4,#0xE]
    BL      optsmenu_loadtext_battlestyle

    LDRB    R0, [R4,#0x10]
    BL      optsmenu_loadtext_sound

    LDRB    R0, [R4,#0x12]
    BL      optsmenu_loadtext_buttons

    LDRB    R0, [R4,#0x14]
    BL      optsmenu_loadtext_menustyle

    LDRB    R0, [R4,#8]
    BL      optsmenu_load_highlight_overlay

    MOVS    R0, #1                      @ a1
    MOVS    R1, #3                      @ vram_offs
    BL      rboxid_to_vram


incr_supertracker:                      @ CODE XREF: optsmenu_switch+1ACj
                                        @ optsmenu_switch+1FCj
                                        @ optsmenu_switch+246j
    LDR     R1, =super
    MOVS    R2, #superstate.multi_purpose_state_tracker
    ADDS    R1, R1, R2


incr_counter:                           @ CODE XREF: optsmenu_switch+6Aj
                                        @ optsmenu_switch+1D8j
                                        @ optsmenu_switch+22Cj
                                        @ optsmenu_switch+25Ej
                                        @ optsmenu_switch+26Aj
                                        @ optsmenu_switch+290j
    LDRB    R0, [R1]
    ADDS    R0, #1
    STRB    R0, [R1]
    B       return

@ ---------------------------------------------------------------------------
off_080BA7FC:.long sub_080BA83C+1       @ DATA XREF: optsmenu_switch:case10r
off_080BA800:.long tasks                @ DATA XREF: optsmenu_switch+2A4r
off_080BA804:.long dword_03005D90       @ DATA XREF: optsmenu_switch+2B2r
off_080BA808:.long super                @ DATA XREF: optsmenu_switch:incr_supertrackerr
@ ---------------------------------------------------------------------------

cleanup:                                @ CODE XREF: optsmenu_switch+20j
                                        @ DATA XREF: optsmenu_switch+58o
    MOVS    R0, #1                      @ jumptable 080BA4FC case 11
    NEGS    R0, R0
    MOVS    R1, #0                      @ a2
    STR     R1, [SP,#0x24+a5]           @ a5
    MOVS    R2, #0x10                   @ a3
    MOVS    R3, #0                      @ a4
    BL      fade_screen

    LDR     R0, =(sub_080BA4C8+1)       @ value
    BL      vblank_handler_set

    LDR     R0, =(sub_080BA4B0+1)
    BL      set_callback2


return:                                 @ CODE XREF: optsmenu_switch+31Ej
    ADD     SP, SP, #0xC
    POP     {R3}
    MOV     R8, R3
    POP     {R4-R7}
    POP     {R0}
    BX      R0

@ End of function optsmenu_switch

@ ---------------------------------------------------------------------------
@ uint32_t off_080BA834
off_080BA834:.long sub_080BA4C8+1       @ DATA XREF: optsmenu_switch+340r
off_080BA838:.long sub_080BA4B0+1       @ DATA XREF: optsmenu_switch+346r
