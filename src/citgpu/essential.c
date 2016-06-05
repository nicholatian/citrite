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
#include <gba/memory.h>

void reset_vram_oam_pal( void )
{
    void* vramaddr = (void*)VRAM_BG;
    u32   zero     = 0u;
    
    for(u32 i = 0u; i < 24u; i += 1u)
    {
        zero          = 0u;
        io_dma3sad    = &zero;
        io_dma3dad    = vramaddr;
        io_dma3cnt_l  = 0x800u;
        io_dma3cnt_h  = DMACNT_DSTCNT_FIXED
            | DMACNT_SRCCNT_INCR
            | DMACNT_REPEAT_OFF
            | DMACNT_TRANSFER_16
            | DMACNT_DRQ_OFF
            | DMACNT_START_IMM
            | DMACNT_IRQONEND_OFF
            | DMACNT_ENABLE_ON;
        
        vram_offs    += 0x1000u;
        i += 1u;
    }
    
    io_dma3sad   = &zero;
    io_dma3dad   = vramaddr;
    io_dma3cnt_l = 0x800u;
    io_dma3cnt_h  = DMACNT_DSTCNT_FIXED
        | DMACNT_SRCCNT_INCR
        | DMACNT_REPEAT_OFF
        | DMACNT_TRANSFER_16
        | DMACNT_DRQ_OFF
        | DMACNT_START_IMM
        | DMACNT_IRQONEND_OFF
        | DMACNT_ENABLE_ON;
    
    zero         = 0u;
    io_dma3sad   = &zero;
    io_dma3dad   = 0x7000000u;
    io_dma3cnt_l = 0x100u;
    io_dma3cnt_h  = DMACNT_DSTCNT_FIXED
        | DMACNT_SRCCNT_INCR
        | DMACNT_REPEAT_OFF
        | DMACNT_TRANSFER_32
        | DMACNT_DRQ_OFF
        | DMACNT_START_IMM
        | DMACNT_IRQONEND_OFF
        | DMACNT_ENABLE_ON;
    
    zero         = 0u;
    io_dma3sad   = &zero;
    io_dma3dad   = 0x5000000u;
    io_dma3cnt_l = 0x200u;
    io_dma3cnt_h  = DMACNT_DSTCNT_FIXED
        | DMACNT_SRCCNT_INCR
        | DMACNT_REPEAT_OFF
        | DMACNT_TRANSFER_16
        | DMACNT_DRQ_OFF
        | DMACNT_START_IMM
        | DMACNT_IRQONEND_OFF
        | DMACNT_ENABLE_ON;
    
    lcd_io_set(0, 0);
    
    sub_080017BC(0);
    
    bg_vram_setup(0, &dword_0855C698, 2u);
    
    bgid_mod_x_offset(0u, 0u, 0u);
    bgid_mod_x_offset(1u, 0u, 0u);
    bgid_mod_x_offset(2u, 0u, 0u);
    bgid_mod_x_offset(3u, 0u, 0u);
    bgid_mod_y_offset(0u, 0u, 0u);
    bgid_mod_y_offset(1u, 0u, 0u);
    bgid_mod_y_offset(2u, 0u, 0u);
    bgid_mod_y_offset(3u, 0u, 0u);
    
    return;
}
