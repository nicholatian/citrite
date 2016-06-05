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

#ifndef __GBA_SEGMENT_H__
#define __GBA_SEGMENT_H__

#include <gba/types.h>

#define BIOS      ((void*)0x0)
#define EWRAM     ((u16*)0x2000000)
#define IWRAM     ((u32*)0x3000000)
#define IO        ((u16*)0x4000000)
#define PAL       ((u16*)0x5000000)
#define PAL_BG    ((u16*)0x5000000)
#define PAL_OBJ   ((u16*)0x5000200)
#define VRAM      ((u16*)0x6000000)
#define VRAM_BG   ((u16*)0x6000000)
#define VRAM_OBJ  ((u16*)0x6010000)
#define OAM       ((u16*)0x7000000)
#define ROM       ((u16*)0x8000000)
#define SRAM      ((u8*)0xE000000)

#endif /* __GBA_SEGMENT_H__ */
