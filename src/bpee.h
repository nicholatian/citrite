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

#ifndef __CITRITE_BPEE_H__
#define __CITRITE_BPEE_H__

#define io_dma0sad                         (*(u32*)0x40000B0)
#define io_dma0dad                         (*(u32*)0x40000B4)
#define io_dma0cnt_l                       (*(u16*)0x40000B8)
#define io_dma0cnt_h                       (*(u16*)0x40000BA)
#define io_dma1sad                         (*(u32*)0x40000BC)
#define io_dma1dad                         (*(u32*)0x40000C0)
#define io_dma1cnt_l                       (*(u16*)0x40000C4)
#define io_dma1cnt_h                       (*(u16*)0x40000C6)
#define io_dma2sad                         (*(u32*)0x40000C8)
#define io_dma2dad                         (*(u32*)0x40000CC)
#define io_dma2cnt_l                       (*(u16*)0x40000D0)
#define io_dma2cnt_h                       (*(u16*)0x40000D2)
#define io_dma3sad                         (*(u32*)0x40000D4)
#define io_dma3dad                         (*(u32*)0x40000D8)
#define io_dma3cnt_l                       (*(u16*)0x40000DC)
#define io_dma3cnt_h                       (*(u16*)0x40000DE)
#define tasks                             (*(void*)0x3005E00)
#define super                     (*(superstate_t*)0x30022C0)
#define textflags                         (*(void*)0x3003014)
#define last_used_item_maybe              (*(void*)0x203CE7C)
#define pal_fade_control                    (*(u8*)0x2037FD4)
#define pal_green_yellow_gradient          (*(u16*)0x855C6A0)

typedef struct
{
    void*    callback1;
    void*    callback2;
    void*    callback2_backup;
    void*    callback5_vblank;
    void*    hblank_callback;
    u32      field_14;
    u32      field_18;
    u32      bits_to_wait_for;
    void*    ptr_vblank_counter;
    u32      field_24;
    u16      buttons0_held;
    u16      buttons1_new;
    u16      buttons2_held_remapped;
    u16      buttons3_new_remapped;
    u16      buttons4_new_and_keyrepeat;
    u16      keypad_countdown;
    u32      unused_apparently;
    sprite_t sprites[128];
    u8       multi_purpose_state_tracker
    u8       gpu_sprites_upload_skip;
}
superstate_t PACK;

typedef struct
{
    u8  y;
    u8  flags_1;
    u8  x;
    u8  msb_of_x_and_flags2;
    u16 attr2;
    u16 rotscaleinfo;
}
sprite_t PACK;

#endif /* __CITRITE_BPEE_H__ */
