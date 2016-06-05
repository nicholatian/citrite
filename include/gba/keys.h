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

#ifndef __GBA_KEYS_H__
#define __GBA_KEYS_H__

#include <gba/types.h>

typedef struct
{
    u16 a      : 1;
    u16 b      : 1;
    u16 select : 1;
    u16 start  : 1;
    u16 right  : 1;
    u16 left   : 1;
    u16 up     : 1;
    u16 down   : 1;
    u16 r      : 1;
    u16 l      : 1;
    u16 unused : 6;
}
io_keyinput_t;

typedef struct
{
    u16 a        : 1;
    u16 b        : 1;
    u16 select   : 1;
    u16 start    : 1;
    u16 right    : 1;
    u16 left     : 1;
    u16 up       : 1;
    u16 down     : 1;
    u16 r        : 1;
    u16 l        : 1;
    u16 unused   : 4;
    u16 use_irq  : 1;
    u16 irq_cond : 1;
}
io_keycnt_t;

#define IO_KEYINPUT ((io_keyinput_t*)0x4000130)
#define IO_KEYCNT   ((io_keycnt_t*)0x4000132)

#endif /* __GBA_KEYS_H__ */
