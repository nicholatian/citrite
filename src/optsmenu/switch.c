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

#include <gba/segment.h>
#include <gf/bpee.h>
#include <gf/bpee/state.h>
#include "citgpu/essential.h"
#include "optsmenu.h"

void optsmenu_switch( void )
{
    switch(super.multi_purpose_state_tracker)
    {
    /**
     * This case resets all video memory, and loads the needed values into
     * VRAM and the LCD I/O registers.
     */
    case 1u:
        reset_vram_oam_pal( );
        
        textbox_bg_init( &dword_0855C680 );
        
        sub_080045B0( );
        
        lcd_io_set( 0x40u, 0u );
        lcd_io_set( 0x44u, 0u );
        lcd_io_set( 0x48u, 1u );
        lcd_io_set( 0x4Au, 0x23u );
        lcd_io_set( 0x50u, 0xC1u );
        lcd_io_set( 0x52u, 0u );
        lcd_io_set( 0x54u, 4u );
        lcd_io_set( 0u,    0x3040u );
        
        gpu_sync_bg_show( 0 );
        gpu_sync_bg_show( 1u );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case loads the tiles address for an rbox, and copies the tileset
     * into BG1.
     */
    case 2u:
        boot_fade_sequence( );
        
        dma_task_delete_something( );
        
        tasks_init( );
        
        obj_and_aux_reset_all( );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case loads the tiles address for an rbox, and copies the tileset
     * into the BG ID specified by RBOX_TILES_BGID.
     */
    case 3u:
        void* tiles_addr = load_rbox_tiles_addr( *((u8*)ptr_03005DA4) >> 3u );
        
        gpu_copy_to_tileset( RBOX_TILES_BGID, *tiles_addr, 0x120u, 0x1A2u );
        
        break;
    /**
     * This case loads the background palette and the current rbox palette
     * from ROM into PAL.
     */
    case 4u:
        void* tiles_addr = load_rbox_tiles_addr( *((u8*)ptr_03005DA4) >> 3u );
        
        gpu_pal_apply( (const u8*)opts_main_menu_bg_pal, 0u,    2u );
        gpu_pal_apply( *((const u8**)tiles_addr + 4u),   0x70u, 0x20u );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case loads the special text palette from ROM into PAL.
     */
    case 5u:
        gpu_pal_apply( (const u8*)optsmenu_special_text_pal, 0x10u, 0x20u );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case enables a faux rbox for the menu text, and does something
     * involving the creation of its tilemap using its rbox ID.
     */
    case 6u:
        u32 rbox_id = enable_rbox( 0 );
        
        optsmenu_tilemap_load_sth2( rbox_id );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case does nothing on its own, however it increments the
     * multipurpose tracker to keep the switch moving forward.
     */
    case 7u:
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case enables the main rbox and does something involving the
     * creation of its tilemap using its rbox ID.
     */
    case 8u:
        u32 rbox_id = enable_rbox( 1u );
        
        optsmenu_tilemap_load_sth( rbox_id );
    /**
     * This case simply calls a function that does something involving the
     * menu’s tilemap.
     */
    case 9u:
        optsmenu_tilemap_sth( );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case loads the data for the options menu into an unknown task
     * struct, and then calls a collection of methods to set up the texts for
     * the options menu; after this it flushes the rbox to VRAM.
     */
    case 10u:
        void* task_ref = &tasks[10u * (u8)task_add(
            (void*)optsmenu_change_item_addtask, 0u )];
        
        u32 text_speed_sth = *((u8*)dword_03005DA4) & 7u;
        
        *((u8*)task_ref + 4u)  = 0u;
        *((u8*)task_ref + 5u)  = text_speed_sth;
        *((u8*)task_ref + 6u)  = *(u8*)(dword_03005D90 + 21u) << 29u >> 31u;
        *((u8*)task_ref + 7u)  = *(u8*)(dword_03005D90 + 21u) << 30u >> 31u;
        *((u8*)task_ref + 8u)  = *(u8*)(dword_03005D90 + 21u) & 1u;
        *((u8*)task_ref + 9u)  = *(u8*)(dword_03005D90 + 19u);
        *((u8*)task_ref + 10u) = *(u8*)(dword_03005D90 + 20u) >> 3u;
        
        optsmenu_loadtext_textspeed( text_speed_sth );
        
        optsmenu_loadtext_battlescene( *((u8*)task_ref + 12u) );
        
        optsmenu_loadtext_battlestyle( *((u8*)task_ref + 14u) );
        
        optsmenu_loadtext_sound( *((u8*)task_ref + 16u) );
        
        optsmenu_loadtext_buttons( *((u8*)task_ref + 18u) );
        
        optsmenu_loadtext_menustyle( *((u8*)task_ref + 20u) );
        
        optsmenu_load_highlight_overlay( *((u8*)task_ref + 8u) );
        
        rboxid_to_vram(RBOX_TILES_BGID, 3u);
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case fades the screen back to normal and then sets the V-Blank
     * handler and callback2 to their respective generic ones.
     */
    case 11u:
        fade_screen( 0xFFFFFFFFu, 0u, 0x10u, 0u, 0u );
        
        vblank_handler_set( optsmenu_load_vblanker );
        
        set_callback2( optsmenu_load_callback );
        
        super.multi_purpose_state_tracker += 1u;
        
        break;
    /**
     * This case removes the V-Blank handler by setting its function pointer
     * to NULL.
     */
    default:
        vblank_handler_set(NULL);
        
        super.multi_purpose_state_tracker += 1u;
    }
}
