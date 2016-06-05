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

#ifndef __GBA_MEMORY_H__
#define __GBA_MEMORY_H__

#define io_dma0sad                         ((void*)0x40000B0)
#define io_dma0dad                         ((void*)0x40000B4)
#define io_dma0cnt_l                       (*(u16*)0x40000B8)
#define io_dma0cnt_h                       (*(u16*)0x40000BA)
#define io_dma1sad                         ((void*)0x40000BC)
#define io_dma1dad                         ((void*)0x40000C0)
#define io_dma1cnt_l                       (*(u16*)0x40000C4)
#define io_dma1cnt_h                       (*(u16*)0x40000C6)
#define io_dma2sad                         ((void*)0x40000C8)
#define io_dma2dad                         ((void*)0x40000CC)
#define io_dma2cnt_l                       (*(u16*)0x40000D0)
#define io_dma2cnt_h                       (*(u16*)0x40000D2)
#define io_dma3sad                         ((void*)0x40000D4)
#define io_dma3dad                         ((void*)0x40000D8)
#define io_dma3cnt_l                       (*(u16*)0x40000DC)
#define io_dma3cnt_h                       (*(u16*)0x40000DE)

#endif // __GBA_MEMORY_H__
