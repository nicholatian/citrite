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

#ifndef __GF_OBJOAM_H__
#define __GF_OBJOAM_H__

#include "../gba/lcd.h"

typedef struct
{
    u8          y;
    u8          flags1;
    u8          x;
    u8          msb_of_x_and_flags2;
    obj_attr2_t attr2;
    union
    {
        obj_attr1a_t rotscale;
        obj_attr1b_t hv_flip;
    };
    attr1;
}
oam_t PACK;

typedef struct
{
    u32 x;
    u32 y;
}
coords32_t;

typedef struct
{
    u16 x;
    u16 y;
}
coords16_t;

typedef struct
{
    u8 x;
    u8 y;
}
coords8_t;

typedef struct
{
    oam_t      final_oam;
    void*      anim_table;
    void*      gfx_table;
    void*      rotscale_table;
    void*      templ;
    u32        unknown0;
    void*      callback;
    coords16_t pos1;
    coords16_t pos2;
    coords8_t  pos_neg_center;
    u8         anim_number;
    u8         anim_frame;
    u8         anim_delay_countdown;
    u8         anim_unk_counter;
    u16        private0;
    u16        private1;
    u16        private2;
    u16        private3;
    u16        private4;
    u16        private5;
    u16        private6;
    u16        private7;
    u8         bitfield2;
    u8         bitfield;
    u16        anim_data_offset;
    u8         unknown1;
    u8         y_height_related;
}
obj_t;

#endif /* __GF_OBJOAM_H__ */
