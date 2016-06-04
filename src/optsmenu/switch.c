/*****************************************************************************\
 *                                                                           * 
 *   ########## ####### ######### ##########  ####### ######### ##########   * 
 *   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   * 
 *   ###          ###      ###    ###     ###   ###      ###    ###          * 
 *   ###          ###      ###    #########     ###      ###    #######      * 
 *   ###          ###      ###    ###   ###     ###      ###    ###          * 
 *   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   * 
 *   ########## #######    ###    ###     ### #######    ###    ##########   * 
 *                                                                           * 
 *                          Pokémon Citrite Version                          * 
 *                              OFFICIAL Source                              * 
 *                                                                           * 
 *                  Copyright © 2014-2016 Alexander Nicholi                  * 
 *                            All rights reserved                            * 
 *                                                                           * 
\*****************************************************************************/

#include "bpee.h"

void optsmenu_switch( void )
{
    u8  *state_tracker; // r1@3
    u32  vram_offs; // r3@4
    unsigned int strange_counter; // r4@4
    int dma3cnt_l_ref2; // r0@5
    int dma3cnt_l_ref; // t1@6
    int dma3cnt_l; // t1@6
    int *rbox_tiles_addr2; // r0@8
    int rbox_tiles_addr; // r0@9
    int rbox_enable_ret0; // r0@11
    int rbox_enable_ret1; // r0@13
    int *task_ref; // r4@15
    int other_state; // r2@15
    int other_state_plus20_3bit; // r0@15
    __int16 zero_ref; // [sp+4h] [bp-20h]@5
    int zero_ref2; // [sp+8h] [bp-1Ch]@6
    
    if ( super.multi_purpose_state_tracker > 0xBu )
    {
set_vblanker:
        
incr_counter:
        ++*state_tracker;
    }
    else
    {
        switch ( super.multi_purpose_state_tracker )
        {
            default:
                goto set_vblanker;
            case 1:
                
            case 2:
                boot_fade_sequence();
                dma_task_delete_something();
                tasks_init();
                obj_and_aux_reset_all();
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 3:
                rbox_tiles_addr2 = (int *)load_rbox_tiles_addr(*(_BYTE *)(dword_03005D90 + 20) >> 3);
                gpu_copy_to_tileset(1u, *rbox_tiles_addr2, 288, 0x1A2u);
                goto incr_supertracker;
            case 4:
                gpu_pal_apply((const char *)opts_main_menu_bg_pal, 0, 2);
                rbox_tiles_addr = load_rbox_tiles_addr(*(_BYTE *)(dword_03005D90 + 20) >> 3);
                gpu_pal_apply(*(const char **)(rbox_tiles_addr + 4), 112, 32);
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 5:
                gpu_pal_apply((const char *)optsmenu_special_text_pal, 0x10, 0x20);
                goto incr_supertracker;
            case 6:
                rbox_enable_ret0 = enable_rbox(0);
                optsmenu_tilemap_load_sth2(rbox_enable_ret0);
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 7:
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 8:
                rbox_enable_ret1 = enable_rbox(1u);
                optsmenu_tilemap_load_sth(rbox_enable_ret1);
                ++super.multi_purpose_state_tracker;
                goto tilemap_load3;
            case 9:
tilemap_load3:
                optsmenu_tilemap_sth();
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 10:
                task_ref = &tasks[10 * (unsigned __int8)task_add((int)optsmenu_change_item_addtask, 0)];
                *((_WORD *)task_ref + 4) = 0;
                other_state = dword_03005D90;
                other_state_plus20_3bit = *(_BYTE *)(dword_03005D90 + 20) & 7;
                *((_WORD *)task_ref + 5) = other_state_plus20_3bit;
                *((_WORD *)task_ref + 6) = (unsigned int)*(_BYTE *)(other_state + 21) << 29 >> 31;
                *((_WORD *)task_ref + 7) = (unsigned int)*(_BYTE *)(other_state + 21) << 30 >> 31;
                *((_WORD *)task_ref + 8) = *(_BYTE *)(other_state + 21) & 1;
                *((_WORD *)task_ref + 9) = *(_BYTE *)(other_state + 19);
                *((_WORD *)task_ref + 10) = (unsigned int)*(_BYTE *)(other_state + 20) >> 3;
                optsmenu_loadtext_textspeed(other_state_plus20_3bit);
                optsmenu_loadtext_battlescene(*((_BYTE *)task_ref + 12));
                optsmenu_loadtext_battlestyle(*((_BYTE *)task_ref + 14));
                optsmenu_loadtext_sound(*((_BYTE *)task_ref + 16));
                optsmenu_loadtext_buttons(*((_BYTE *)task_ref + 18));
                optsmenu_loadtext_menustyle(*((_BYTE *)task_ref + 20));
                optsmenu_load_highlight_overlay(*((_BYTE *)task_ref + 8));
                rboxid_to_vram(1u, 3u);
incr_supertracker:
                state_tracker = &super.multi_purpose_state_tracker;
                goto incr_counter;
            case 11:
                fade_screen(0xFFFFFFFF, 0, 0x10u, 0, 0);
                vblank_handler_set((uint32_t)optsmenu_load_vblanker);
                set_callback2(optsmenu_load_callback);
                break;
        }
    }
}

static inline void case_0( void )
{
    vblank_handler_set(NULL);
    super.multi_purpose_state_tracker += 1u;
}

static inline void case_1( void )
{
    u32 vram_offs = 0x6000000u;
    u32 strange_counter = 1u;
    do
    {
        zero_ref = 0;
        io_dma3sad = (u32)&zero_ref;
        io_dma3dad = vram_offs;
        *(u32*)&io_dma3cnt_l = 0x81000800u;
        dma3cnt_l_ref2 = *(_DWORD *)&io_dma3cnt_l;
        vram_offs += 0x1000u;
        strange_counter += 1u;
    }
    while ( strange_counter < 24u );
    io_dma3sad = (u32)&zero_ref;
    io_dma3dad = vram_offs;
    *(_DWORD *)&io_dma3cnt_l = (strange_counter >> 1u) | 0x81000000u;
    zero_ref2 = 0;
    io_dma3sad = (u32)&zero_ref2;
    io_dma3dad = 0x7000000;
    *(_DWORD *)&io_dma3cnt_l = 0x85000100;
    dma3cnt_l_ref = *(_DWORD *)&io_dma3cnt_l;
    zero_ref = 0;
    io_dma3sad = (int)&zero_ref;
    io_dma3dad = 0x5000000;
    *(_DWORD *)&io_dma3cnt_l = 0x81000200;
    dma3cnt_l = *(_DWORD *)&io_dma3cnt_l;
    lcd_io_set(0, 0);
    sub_080017BC(0);
    bg_vram_setup(0, (int)&dword_0855C698, 2u);
    bgid_mod_x_offset(0, 0, 0);
    bgid_mod_y_offset(0, 0, 0);
    bgid_mod_x_offset(1u, 0, 0);
    bgid_mod_y_offset(1u, 0, 0);
    bgid_mod_x_offset(2u, 0, 0);
    bgid_mod_y_offset(2u, 0, 0);
    bgid_mod_x_offset(3u, 0, 0);
    bgid_mod_y_offset(3u, 0, 0);
    textbox_bg_init((int)&dword_0855C680);
    sub_080045B0();
    lcd_io_set(0x40u, 0);
    lcd_io_set(0x44u, 0);
    lcd_io_set(0x48u, 1u);
    lcd_io_set(0x4Au, 0x23u);
    lcd_io_set(0x50u, 0xC1u);
    lcd_io_set(0x52u, 0);
    lcd_io_set(0x54u, 4u);
    lcd_io_set(0, 0x3040u);
    gpu_sync_bg_show(0);
    gpu_sync_bg_show(1u);
    goto incr_supertracker;
}
