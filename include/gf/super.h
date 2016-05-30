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

#ifndef __GF_SUPER_H__
#define __GF_SUPER_H__

#include "objoam.h"

typedef struct
{
    void* callback1;
    void* callback2;
    void* callback2_backup;
    void* callback5_vblank;
    void* hblank_callback;
    u32   unknown0;
    u32   unknown1;
    u32   bits_to_wait_for;
    void* ptr_vblank_counter;
    u32   unknown2;
    u16   buttons0_held;
    u16   buttons1_new;
    u16   buttons2_held_remapped;
    u16   buttons3_new_remapped;
    u16   buttons4_new_and_keyrepeat;
    u16   keypad_countdown;
    u32   unused_apparently;
    oam_t sprites[128];
    u8    multi_purpose_state_tracker;
    u8    gpu_sprites_upload_skip; /* setting this to 1 messes up the OBJs */
}
super_t;

#if defined(__BPEE__)
#define SUPER ((super_t*)0x30022C0)
#elif defined(__BPRE__)
#define SUPER ((super_t*)0x30030F0)
#endif

#endif
