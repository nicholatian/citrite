@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@                                                                           @@
@@   ########## ####### ######### ##########  ####### ######### ##########   @@
@@   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   @@
@@   ###          ###      ###    ###     ###   ###      ###    ###          @@
@@   ###          ###      ###    #########     ###      ###    #######      @@
@@   ###          ###      ###    ###   ###     ###      ###    ###          @@
@@   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   @@
@@   ########## #######    ###    ###     ### #######    ###    ##########   @@
@@                                                                           @@
@@                          Pokémon Citrite Version                          @@
@@                              OFFICIAL Source                              @@
@@                                                                           @@
@@                  Copyright © 2014-2016 Alexander Nicholi                  @@
@@                            All rights reserved                            @@
@@                                                                           @@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.file "scripts/shared.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "pokescript.s"
.include "definitions.s"

.section .data

@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Shared PokéScript routines
@ DESCRIPTION: These scripts are to be utilised by other scripts throughout the
@              game, hence the name.


@@ globl void do_exclbubble( u16 person_id, u16 play_sfx )
@@
@@ max call depth: 0

.balign 4, 0
.globl do_exclbubble

do_exclbubble:
    
    s_comparevar 0x8001 false
    s_if 0x1 "jump" .Lexcl_skipsfx
    s_playsfx EXCL_BEEP

.Lexcl_skipsfx:
    
    s_move 0x8000 .Lexcl_move
    s_waitmove 0x0
    s_return

.Lexcl_move:
    
    .byte 0x56, 0xFE



@@ globl void do_huhbubble(person_id, play_sfx)
@@
@@ max call depth: 0

.balign 4, 0
.globl do_huhbubble

do_huhbubble:
    
    s_comparevar 0x8001 false
    s_if 0x1 "jump" .Lhuh_skipsfx
    s_playsfx EXCL_BEEP

.Lhuh_skipsfx:
    
    s_move 0x8000 .Lhuh_move
    s_waitmove 0x0
    s_return

.Lhuh_move:
    
    .byte 0x56, 0xFE



@@ noreturn stereo_dialogue( void )
@@
@@ max call depth: 0

.balign 4, 0
.globl stereo_dialogue

stereo_dialogue:
    
    s_loadptr 0x0 stereo_text
    s_callstd MSG_STANDARD
    s_end



@ noreturn rock_smash()
@
@ max call depth: 0

.balign 4, 0
.globl rock_smash

rock_smash:
    
    s_lockall
    s_checkflag 0x869
    s_if false "jump" .Lrs_nogo
    s_checkattack ROCKSMASH
    s_comparevar LASTRESULT 0x6
    s_if _eq "jump" .Lrs_nogo
    s_setanimation 0x0 LASTRESULT
    s_bufferpartypoke 0x0 LASTRESULT
    s_bufferattack 0x1 ROCKSMASH
    s_loadptr 0x0 rocksmash_breakable
    s_callstd MSG_YESNO
    s_comparevar LASTRESULT NO
    s_if _eq "jump" .Lrs_exit
    s_loadptr 0x0 rocksmash_usemove
    s_callstd MSG_NOCLOSE
    s_closebutton
    s_doanimation 0x25
    s_waitstate
    
.Lrs_continue:
    
    s_move LASTTALKED .Lrs_face
    s_waitmove 0x0
    s_disappear LASTTALKED
    s_specialval LASTRESULT 0x12C
    s_comparevar LASTRESULT 0x1
    s_if _eq jump releaseall_end
    s_special 0xAE
    s_comparevar LASTRESULT 0x0
    s_if _eq jump releaseall_end
    s_waitstate
    s_releaseall
    s_end

.Lrs_nogo:
    
    s_loadptr 0x0 rocksmash_ruggedrock
    s_callstd MSG_NOCLOSE
    s_releaseall
    s_end

.Lrs_exit:
    
    s_closebutton
    s_releaseall
    s_end

.Lrs_face:
    
    .byte 0x5A, 0xFE
