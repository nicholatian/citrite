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

#define io_dma0sad   ((void*)0x40000B0u)
#define io_dma0dad   ((void*)0x40000B4u)
#define io_dma0cnt_l (*(u16*)0x40000B8u)
#define io_dma0cnt_h (*(u16*)0x40000BAu)
#define io_dma1sad   ((void*)0x40000BCu)
#define io_dma1dad   ((void*)0x40000C0u)
#define io_dma1cnt_l (*(u16*)0x40000C4u)
#define io_dma1cnt_h (*(u16*)0x40000C6u)
#define io_dma2sad   ((void*)0x40000C8u)
#define io_dma2dad   ((void*)0x40000CCu)
#define io_dma2cnt_l (*(u16*)0x40000D0u)
#define io_dma2cnt_h (*(u16*)0x40000D2u)
#define io_dma3sad   ((void*)0x40000D4u)
#define io_dma3dad   ((void*)0x40000D8u)
#define io_dma3cnt_l (*(u16*)0x40000DCu)
#define io_dma3cnt_h (*(u16*)0x40000DEu)

#define DMACNT_DSTCNT_INCR        (0u)
#define DMACNT_DSTCNT_DECR        (1u << 5u)
#define DMACNT_DSTCNT_FIXED       (2u << 5u)
#define DMACNT_DSTCNT_INCR_RELOAD (3u << 5u)
#define DMACNT_SRCCNT_INCR        (0u)
#define DMACNT_SRCCNT_DESC        (1u << 7u)
#define DMACNT_SRCCNT_FIXED       (2u << 7u)
#define DMACNT_REPEAT_OFF         (0u)
#define DMACNT_REPEAT_ON          (1u << 9u)
#define DMACNT_TRANSFER_16        (0u)
#define DMACNT_TRANSFER_32        (1u << 10u)
#define DMACNT_DRQ_OFF            (0u)
#define DMACNT_DRQ_ON             (1u << 11u)
#define DMACNT_START_IMM          (0u)
#define DMACNT_START_VBLANK       (1u << 12u)
#define DMACNT_START_HBLANK       (2u << 12u)
#define DMACNT_START_SPECIAL      (3u << 12u)
#define DMACNT_IRQONEND_OFF       (0u)
#define DMACNT_IRQONEND_ON        (1u << 14u)
#define DMACNT_ENABLE_OFF         (0u)
#define DMACNT_ENABLE_ON          (1u << 15u)

#endif // __GBA_MEMORY_H__
