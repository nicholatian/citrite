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

#ifndef __GBA_LCD_H__
#define __GBA_LCD_H__

#include <gba/types.h>

typedef struct
{
    u16 bg_mode      : 3;
    u16 cgb_mode     : 1;
    u16 frame_sel    : 1;
    u16 hblank_intv  : 1;
    u16 obj_vram_dim : 1;
    u16 force_blank  : 1;
    u16 show_bg0     : 1;
    u16 show_bg1     : 1;
    u16 show_bg2     : 1;
    u16 show_bg3     : 1;
    u16 show_obj     : 1;
    u16 show_win0    : 1;
    u16 show_win1    : 1;
    u16 show_objwin  : 1;
}
io_dispcnt_t;

#define IO_DISPCNT   ((io_dispcnt_t*)0x4000000)
#define IO_GREENSWAP (*(bool*)0x4000002)

typedef struct
{
    u16 v_blank       : 1;
    u16 h_blank       : 1;
    u16 v_counter     : 1;
    u16 v_blank_irq   : 1;
    u16 h_blank_irq   : 1;
    u16 v_counter_irq : 1;
    u16 unused        : 2;
    u16 v_count       : 8;
}
io_dispstat_t;

#define IO_DISPSTAT  ((io_dispstat_t*)0x4000004)

typedef struct
{
    u16 current : 8;
    u16 unused  : 8;
}
io_vcount_t;

#define IO_VCOUNT (*(volatile u16*)0x4000006)

typedef struct
{
    u16 priority    : 2;
    u16 img_sector  : 2;
    u16 unused      : 2;
    u16 mosaic      : 1;
    u16 pal_mode    : 1;
    u16 map_sector  : 5;
    u16 overflow    : 1;
    u16 screen_size : 2;
}
io_bgcnt_t;

#define IO_BG0CNT  ((io_bgcnt_t*)0x4000008)
#define IO_BG1CNT  ((io_bgcnt_t*)0x400000A)
#define IO_BG2CNT  ((io_bgcnt_t*)0x400000C)
#define IO_BG3CNT  ((io_bgcnt_t*)0x400000E)

#define IO_BG0HOFS (*(u16*)0x4000010)
#define IO_BG0VOFS (*(u16*)0x4000012)
#define IO_BG1HOFS (*(u16*)0x4000014)
#define IO_BG1VOFS (*(u16*)0x4000016)
#define IO_BG2HOFS (*(u16*)0x4000018)
#define IO_BG2VOFS (*(u16*)0x400001A)
#define IO_BG3HOFS (*(u16*)0x400001C)
#define IO_BG3VOFS (*(u16*)0x400001E)

typedef struct
{
    u16 fractional : 8;
    u16 integer    : 7;
    u16 sign       : 1;
}
io_bgfloat16_t;

typedef struct
{
    u32 fractional : 8;
    u32 integer    : 19;
    u32 sign       : 1;
    u32 unused     : 4;
}
io_bgfloat32_t;

#define IO_BG2PA  ((io_bgfloat16_t*)0x4000020)
#define IO_BG2PB  ((io_bgfloat16_t*)0x4000022)
#define IO_BG2PC  ((io_bgfloat16_t*)0x4000024)
#define IO_BG2PD  ((io_bgfloat16_t*)0x4000026)
#define IO_BG2X_L ((io_bgfloat32_t*)0x4000028)
#define IO_BG2X_H ((io_bgfloat32_t*)0x400002A)
#define IO_BG2Y_L ((io_bgfloat32_t*)0x400002C)
#define IO_BG2Y_H ((io_bgfloat32_t*)0x400002E)
#define IO_BG3PA  ((io_bgfloat16_t*)0x4000020)
#define IO_BG3PB  ((io_bgfloat16_t*)0x4000022)
#define IO_BG3PC  ((io_bgfloat16_t*)0x4000024)
#define IO_BG3PD  ((io_bgfloat16_t*)0x4000026)
#define IO_BG3X_L ((io_bgfloat32_t*)0x4000038)
#define IO_BG3X_H ((io_bgfloat32_t*)0x400003A)
#define IO_BG3Y_L ((io_bgfloat32_t*)0x400003C)
#define IO_BG3Y_H ((io_bgfloat32_t*)0x400003E)

typedef struct
{
    u8 left;
    u8 right;
}
io_winh_t;

#define IO_WIN0H ((io_winh_t*)0x4000040)
#define IO_WIN1H ((io_winh_t*)0x4000042)

typedef struct
{
    u8 top;
    u8 bottom;
}
io_winv_t;

#define IO_WIN0V ((io_winv_t*)0x4000044)
#define IO_WIN1V ((io_winv_t*)0x4000046)

typedef struct
{
    u16 win0_bg0 : 1;
    u16 win0_bg1 : 1;
    u16 win0_bg2 : 1;
    u16 win0_bg3 : 1;
    u16 win0_obj : 1;
    u16 win0_eff : 1;
    u16 unused0  : 2;
    u16 win1_bg0 : 1;
    u16 win1_bg1 : 1;
    u16 win1_bg2 : 1;
    u16 win1_bg3 : 1;
    u16 win1_obj : 1;
    u16 win1_eff : 1;
    u16 unused1  : 2;
}
io_winin_t;

#define IO_WININ ((io_winin_t*)0x4000048)

typedef struct
{
    u16 out_bg0    : 1;
    u16 out_bg1    : 1;
    u16 out_bg2    : 1;
    u16 out_bg3    : 1;
    u16 out_obj    : 1;
    u16 out_eff    : 1;
    u16 unused0    : 2;
    u16 objwin_bg0 : 1;
    u16 objwin_bg1 : 1;
    u16 objwin_bg2 : 1;
    u16 objwin_bg3 : 1;
    u16 objwin_obj : 1;
    u16 objwin_eff : 1;
    u16 unused1    : 2;
}
io_winout_t;

#define IO_WINOUT ((io_winout_t*)0x400004A)

typedef struct
{
    u32 bg_h   : 4;
    u32 bg_v   : 4;
    u32 obj_h  : 4;
    u32 obj_v  : 4;
    u32 unused : 16;
}
io_mosaic_t;

#define IO_MOSAIC ((io_mosaic_t*)0x400004C)

typedef struct
{
    u16 bg0_target1  : 1;
    u16 bg1_target1  : 1;
    u16 bg2_target1  : 1;
    u16 bg3_target1  : 1;
    u16 obj_target1  : 1;
    u16 back_target1 : 1;
    u16 color_eff    : 2;
    u16 bg0_target2  : 1;
    u16 bg1_target2  : 1;
    u16 bg2_target2  : 1;
    u16 bg3_target2  : 1;
    u16 obj_target2  : 1;
    u16 back_target2 : 1;
}
io_bldcnt_t;

#define IO_BLDCNT    ((io_bldcnt_t*)0x4000050)

typedef struct
{
    u8 eva;
    u8 evb;
}
io_bldalpha_t;

#define IO_BLDALPHA  ((io_bldalpha_t*)0x4000052)

typedef struct
{
    u8 evy;
}
io_bldy_t;

#define IO_BLDY      ((io_bldy_t*)0x4000054)

#define IMG_SECTOR(n) (((n)*0x4000)+0x6000000)
#define MAP_SECTOR(n) (((n)*0x800)+0x6000000)
#define PAL_SECTOR(n) (((n)*2)+0x5000000)

typedef struct
{
    u16 y_pos    : 8;
    u16 rotscal  : 1;
    u16 dbl_dis  : 1;
    u16 obj_mode : 2;
    u16 mosaic   : 1;
    u16 pal_mode : 1;
    u16 shape    : 2;
}
obj_attr0_t;

typedef struct
{
    u16 x_pos        : 9;
    u16 roscal_param : 5;
    u16 obj_size     : 2;
}
obj_attr1a_t;

typedef struct
{
    u16 xpos     : 9;
    u16 unused   : 3;
    u16 h_flip   : 1;
    u16 v_flip   : 1;
    u16 obj_size : 2;
}
obj_attr1b_t;

typedef struct
{
    u16 charname : 10;
    u16 priority : 2;
    u16 pal_num  : 4;
}
obj_attr2_t;

#endif /* __GBA_LCD_H__ */
