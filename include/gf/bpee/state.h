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

#ifndef __GF_STATE_H__
#define __GF_STATE_H__

#include "../objoam.h"
#include "../../gba/keys.h"

#define GF_OBJECTS   ((obj_t*)0x2020630)
#define GF_OAMS      ((oam_t*)0x30022F8)
#define GF_OAM_PALS  ((color_t*)0x2037914)
#define GF_BG_PALS   ((color_t*)0x2037714)
#define GF_BG_PALS2  ((color_t*)0x2037B14)
#define GF_OAM_PALS2 ((color_t*)0x2037D14)

#define GF_KEYS     ((io_keyinput_t*)0x30022EE)
#define GF_KEYSHELD ((io_keyinput_t*)0x30022EC)

#define KEYS_PRESSED(k) (GF_KEYS & k)
#define KEYS_HELD(k)    (GF_KEYSHELD & k)

#define LASTRESULT (*(u16*)0x20375F0)
#define VAR_8004   (*(u16*)0x20375E0)

#define FADESCREEN_DONE (*(u8*)0x02037FDB)

#define POKE_PARTY      ((void*)0x20244EC)
#define POKE_PARTY_SIZE (*(u8*)0x20244E9)

#define SAVEBLOCK1    (*(u32*)0x3005D90)
#define PLAYER_GENDER (*(u8*)(SAVEBLOCK1 + 0x8))

typedef struct
{
    void*    callback1;
    void*    callback2;
    void*    callback2_backup;
    void*    callback5_vblank;
    void*    hblank_callback;
    u32      field_14;
    u32      field_18;
    u32      bits_to_wait_for;
    void*    ptr_vblank_counter;
    u32      field_24;
    u16      buttons0_held;
    u16      buttons1_new;
    u16      buttons2_held_remapped;
    u16      buttons3_new_remapped;
    u16      buttons4_new_and_keyrepeat;
    u16      keypad_countdown;
    u32      unused_apparently;
    sprite_t sprites[128];
    u8       multi_purpose_state_tracker
    u8       gpu_sprites_upload_skip;
}
superstate_t PACK;

#endif /* __GF_STATE_H__ */
