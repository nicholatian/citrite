/*****************************************************************************\
 *                                                                           * 
 *   .d8888b.  888888b.         d8888          d88P    .d8888b.  8888888888  * 
 *  d88P  Y88b 888  "88b       d88888         d88P    d88P  Y88b 888         * 
 *  888    888 888  .88P      d88P888        d88P     888    888 888         * 
 *  888        8888888K.     d88P 888       d88P      888        8888888     * 
 *  888  88888 888  "Y88b   d88P  888      d88P       888  88888 888         * 
 *  888    888 888    888  d88P   888     d88P        888    888 888         * 
 *  Y88b  d88P 888   d88P d8888888888    d88P         Y88b  d88P 888         * 
 *   "Y8888P88 8888888P" d88P     888   d88P           "Y8888P88 888         * 
 *                                                                           * 
 *                       Game Boy Advance / Game Freak                       * 
 *                           C ROM Hacking Library                           * 
 *                                                                           * 
 *                  Copyright © 2015-2016 Alexander Nicholi                  * 
 *                                                                           * 
 * Licensed under the Apache License, Version 2.0 (the “License”); you may   * 
 * not use this file except in compliance with the License. You may obtain a * 
 * copy of the License at                                                    *
 *                                                                           * 
 *     http://www.apache.org/licenses/LICENSE-2.0                            * 
 *                                                                           * 
 * Unless required by applicable law or agreed to in writing, software       * 
 * distributed under the License is distributed on an “AS IS” BASIS, WITHOUT * 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the  * 
 * License for the specific language governing permissions and limitations   * 
 * under the License.                                                        * 
\*****************************************************************************/

#ifndef __GF_METHOD_H__
#define __GF_METHOD_H__

#include "../gba/types.h"

void setvar(u16 var, u16 value);

u32 random(u32 max)
{
    return modulus(random_(), max);
}

u32 modulus(u32 input, u32 dividend);

u32 random_();

void oam_rotate(u8 oam, u16 x, u16 y, u16 rot);

void* malloc(u32 size);
void* calloc(u32 size);
void  free(void* addr);

void task_exec();
void objc_exec();
void obj_sync_something();
void fade_and_return_progress_probably();

void exit_to_ow_();

void exit_to_ow(void* ret)
{
    store_callback(ret);
    
    if(globals != NULL)
    {
        free(globals);
    }
    
    exit_to_ow_();
}

void update_things()
{
    task_exec();
    objc_exec();
    obj_sync_something();
    fade_and_return_progress_probably();
}

void gpu_sprites_upload();
void copy_queue_process();
void gpu_pal_upload();

void update_things2()
{
    gpu_sprites_upload();
    copy_queue_process();
    gpu_pal_upload();
}

void fade_screen(u32 bitmask, u16 unk, u16 end_lumin, u16 start_lumin,
    u16 color);

void fade_to_black()
{
    fade_screen(0xFFFFFFFF, 0, 0, 16, 0);
}

void fade_from_black()
{
    fade_screen(0xFFFFFFFF, 0, 16, 0, 0);
}

void load_objgfx(void* source);
void load_compressed_objgfx(void* source);
void memcpy(void *source, void *dest, void *size);
void memset(void *source, void *dest, void *size);

void copy_pal(void* source, u8 palnum)
{
    memcpy(source,GF_BG_PALS+(num*0x10), 0x8);
    memcpy(source,GF_BG_PALS2+(num*0x10), 0x8);
}

void LZ77UnCompWram(void* source, void* dest);
void LZ77UnCompVram(void* source, void* dest);
void LZ77UnCompAnyRam(void* source, void* dest, u32 size);

void Div(u32 dividend, u32 divisor);
void CpuSet(u32 a1, u32 a2, u32 a3);

void copy_compressed_pal(void *source, u8 num)
{
	LZ77UnCompWram(source,BG_PaletteMem+(num*0x10));
	LZ77UnCompWram(source,BG_PaletteMem2+(num*0x10));
}

void play_fanfare(u16 song_id);
u8   wait_fanfare();
void play_sound(u16 song_id);
void play_cry(u16 poke_id, u8 effect);
u8   wait_sound();
void lcd_io_set(u16 offset, u16 value);
void gpu_sync_bg_show(u8 bg);
void obj_aux_and_reset_all();
void set_callback2(void* function);
void vblank_handler_set(void* function);
void box_border_load_tiles_and_pal(u32 tile, u8 pal);
void box_curved_1_load_tiles_and_pal(u32 tile, u8 pal);
void enable_rbox(u8 bg);
void template_instanciate_forward_search(int *unknown, s16 *x, s16 *y,
    u8 *derp)

#endif /* __GF_METHOD_H__ */
