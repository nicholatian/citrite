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

void optsmenu_switch( void )
{
    switch(super.multi_purpose_state_tracker)
    {
    case 1u:
        case_1( );
        break;
    case 2u:
        case_2( );
        break;
    case 3u:
        case_3( );
        break;
    case 4u:
        case_4( );
        break;
    case 5u:
        case_5( );
        break;
    case 6u:
        case_6( );
        break;
    case 7u:
        case_7( );
        break;
    case 8u:
        case_8( );
        break;
    case 9u:
        case_9( );
        break;
    case 10u:
        case_10( );
        break;
    case 11u:
        case_11( );
        break;
    default:
        case_0( );
    }
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 0
 * DESCRIPTION: This method removes the V-Blank handler by setting its function
 *              pointer to NULL.
 */

static inline void case_0( void )
{
    vblank_handler_set(NULL);
    
    super.multi_purpose_state_tracker += 1u;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 1
 * DESCRIPTION: This method resets all video memory, and loads the needed
 *              values into VRAM and the LCD I/O registers.
 */

static inline void case_1( void )
{
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
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 2
 * DESCRIPTION: This method loads the tiles address for an rbox, and copies the
 *              tileset into BG1.
 */

static inline void case_2( void )
{
    boot_fade_sequence( );
    
    dma_task_delete_something( );
    
    tasks_init( );
    
    obj_and_aux_reset_all( );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 3
 * DESCRIPTION: This method loads the tiles address for an rbox, and copies the
 *              tileset into the BG ID specified by RBOX_TILES_BGID.
 */

#define RBOX_TILES_BGID 1u

static inline void case_3( void )
{
    void* tiles_addr = load_rbox_tiles_addr( *((u8*)ptr_03005DA4) >> 3u );
    
    gpu_copy_to_tileset( RBOX_TILES_BGID, *tiles_addr, 0x120u, 0x1A2u );
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 4
 * DESCRIPTION: This method loads the background palette and the current rbox
 *              palette from ROM into PAL.
 */

static inline void case_4( void )
{
    void* tiles_addr = load_rbox_tiles_addr( *((u8*)ptr_03005DA4) >> 3u );
    
    gpu_pal_apply( (const u8*)opts_main_menu_bg_pal, 0u,    2u );
    gpu_pal_apply( *((const u8**)tiles_addr + 4u),   0x70u, 0x20u );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 5
 * DESCRIPTION: This method loads the special text palette from ROM into PAL.
 */

static inline void case_5( void )
{
    gpu_pal_apply( (const u8*)optsmenu_special_text_pal, 0x10u, 0x20u );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 6
 * DESCRIPTION: This method enables a faux rbox for the menu text, and does
 *              something involving the creation of its tilemap using its rbox
 *              ID.
 */

static inline void case_6( void )
{
    u32 rbox_id = enable_rbox( 0 );
    
    optsmenu_tilemap_load_sth2( rbox_id );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 7
 * DESCRIPTION: This method does nothing on its own, however it increments the
 *              multipurpose tracker to keep the switch moving forward.
 */

static inline void case_7( void )
{
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 8
 * DESCRIPTION: This method enables the main rbox and does something involving
 *              the creation of its tilemap using its rbox ID.
 */

static inline void case_8( void )
{
    u32 rbox_id = enable_rbox( 1u );
    
    optsmenu_tilemap_load_sth( rbox_id );
    
    case_9( );
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 9
 * DESCRIPTION: This method simply calls a function that does something
 *              involving the menu’s tilemap.
 */

static inline void case_9( void )
{
    optsmenu_tilemap_sth( );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 10
 * DESCRIPTION: This method loads the data for the options menu into an unknown
 *              task struct, and then calls a collection of methods to set up
 *              the texts for the options menu; after this it flushes the rbox
 *              to VRAM.
 */

static inline void case_10( void )
{
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
    
    return;
}

/** ============================ F U N C T I O N ============================ *
 * 
 * TITLE:       Options Menu loading switch, case 11
 * DESCRIPTION: This method fades the screen back to normal and then sets the
 *              V-Blank handler and callback2 to their respective generic ones.
 */

static inline void case_11( void )
{
    fade_screen( 0xFFFFFFFFu, 0u, 0x10u, 0u, 0u );
    
    vblank_handler_set( optsmenu_load_vblanker );
    
    set_callback2( optsmenu_load_callback );
    
    super.multi_purpose_state_tracker += 1u;
    
    return;
}
