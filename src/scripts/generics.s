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

.file "scripts/generics.s"
.ident "AS: (devkitARM release 45) 2.25.1"

.include "pokescript.s"
.include "defs.s"


@ ============================ D A T A   R E P O ============================ @
@
@ TITLE:       Generic PokéScript functions
@ DESCRIPTION: A collection of generic scripts which other scripts may use to
@              save time and space.


@@ generic release_end( void )
@@ generic end( void )
@@
@@ max call depth: 0

.globl release_end
.globl end
.balign 4, 0

release_end:
    
    s_release

end:
    
    s_end



@@ generic releaseall_end( void )
@@
@@ max call depth: 0

.globl releaseall_end
.balign 4, 0

releaseall_end:
    
    s_releaseall
    s_end



@@ generic release_return( void )
@@ generic return( void )
@@
@@ max call depth: 0

.globl release_return
.globl return
.balign 4, 0

release_return:
    
    s_release

return:
    
    s_return



@@ generic releaseall_return( void )
@@
@@ max call depth: 0

.globl releaseall_return
.balign 4, 0

releaseall_return:
    
    s_releaseall
    s_return
