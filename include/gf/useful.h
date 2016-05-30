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

#ifndef __GF_USEFUL_H__
#define __GF_USEFUL_H__

#include <gf/texts.h>
#define DMA3Source		(*(u32 *) 0x040000D4)
#define DMA3Dest		(*(u32 *) 0x040000D8)
#define DMA3Options		(*(u32 *) 0x040000DC)

#define monSpriteLoc 0x06011000

/* Structures */

typedef struct
{
	u16 x, y;
} Position;

typedef struct
{
	u8 y, flags, x, msbXFlags;
	u16 tileProPal, irrelevant;
} Oam;

typedef struct
{
	Oam oam;
	u32 animation;
	u8 fC, fD, fE, fF;
	u32 f10, objectTemplate, f18, callback;
	Position pos1, pos2;
	u8 pos3x, pos3y, animNum, animFrame, time, f2D;
	Position iPos, iVel;
	u32 derp1, derp2;
	u8 f42, f43, end;
} OAMThingy;

typedef struct
{
	u16 f0, f1;
	u32 oam, animation, gfx, animation2, callback;
	u8 end;
} ObjTemplate;

typedef struct
{
	u32 palette;
	u32 number;
} PalStructure;

#endif /* __GF_USEFUL_H__ */
