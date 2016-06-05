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

#ifndef	__GBA_COMPRESS_H__
#define	__GBA_COMPRESS_H__

#include <gba/system.h>
#include <gba/types.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct
{
	u16 SrcNum;				/* Source Data Byte Size */
	u8  SrcBitNum;			/* 1 Source Data Bit Number */
	u8  DestBitNum;			/* 1 Destination Data Bit Number */
	u32 DestOffset:31;		/* Number added to Source Data */
	u32 DestOffset0_On:1;	/* Flag to add/not add Offset to 0 Data */
} BUP;

void BitUnPack( void  *source, void *dest, BUP* bup );
void LZ77UnCompWram( void *source, void *dest );
void LZ77UnCompVram( void *source, void *dest );
void HuffUnComp( void *source, void *dest );
void RLUnCompWram( void *source, void *dest );
void RLUnCompVram( void *source, void *dest );
void Diff8bitUnFilterWram( void *source, void *dest );
void Diff8bitUnFilterVram( void *source, void *dest );
void Diff16bitUnFilter( void *source, void *dest );

#ifdef __cplusplus
}	   /* extern "C" */
#endif

#endif /* __GBA_COMPRESS_H__ */

void BitUnPack(void  *source, void *dest, BUP* bup)
{
	system(16);
}

void LZ77UnCompWram(void *source, void *dest)
{
	system(17);
}

void LZ77UnCompVram(void *source, void *dest)
{
	system(18);
}

void HuffUnComp(void *source, void *dest)
{
	system(19);
}

void RLUnCompWram(void *source, void *dest)
{
	system(20);
}

void RLUnCompVram(void *source, void *dest)
{
	system(21);
}

void Diff8bitUnFilterWram(void *source, void *dest)
{
	system(22);
}

void Diff8bitUnFilterVram(void *source, void *dest)
{
	system(23);
}

void Diff16bitUnFilter(void *source, void *dest)
{
	system(24);
}
