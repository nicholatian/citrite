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

#ifndef __GF_SPRITES_H__
#define __GF_SPRITES_H__

#define dummyAnimData	 (u32 *) 0x082EC6A8
#define dummyAnimRoutine (u32 *) 0x08007429
const Oam size8Oam = {50,3,50,0x20,0x1,0};
const Oam size16Oam = {50,3,50,0x40,0x1,0};
const Oam size32Oam = {50,3,50,0x80,0x1,0};
const Oam size64Oam = {50,3,50,0xC0,0x1,0};


unsigned char nopAnimation[8] = {  1+240, 1, 0xA, 0,
					0xFE, 0xFF, 0, 0 };
unsigned char tile0Animation[8] = {  1, 0, 0xA, 0,
					0xFE, 0xFF, 0, 0 };
const unsigned int tile0AnimTable = &tile0Animation;
const ObjTemplate size8Template = {2,1,&size8Oam,&tile0AnimTable,0,dummyAnimData,dummyAnimRoutine,0xFF};
const ObjTemplate size32Template = {2,1,&size32Oam,&tile0AnimTable,0,dummyAnimData,dummyAnimRoutine,0xFF};

#endif /* __GF_SPRITES_H__ */
