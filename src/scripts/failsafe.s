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

.file "scripts/failsafe.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "pokescript.s"
.include "definitions.s"


@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Scripts for the Failsafe Room
@ DESCRIPTION: These scripts are used in the failsafe room built into the ROM
@              for empty warps.


@@ noreturn failsafe_message( void )
@@
@@ max call depth: 0

.globl failsafe_message
.balign 4, 0

failsafe_message:
    
    s_loadptr 0x0 failsafe_text
    s_callstd MSG_SIGN
    s_end
