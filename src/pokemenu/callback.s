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

.file "pokemenu/callback.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ ============================ S U B R O U T I N E ============================
@
@ TITLE:       Pokémenu Loading Routine Callback
@ DESCRIPTION: This is the callback set to perform environmental checks and the
@              switch for loading the graphics for the Pokémenu.

.section .text
.balign 4
.thumb_func
.globl load_pokemenu

@@ void load_pokemenu( void )

load_pokemenu:
    
    PUSH    {LR}

.Lloop:
    LDR     R1, =pokemenu_prep
    BL      .Llinker
    
    CMP     R0, #1
    BEQ     .Lreturn
    
    LDR     R1, =pokemenu_switch
    BL      .Llinker
    
    CMP     R0, #1
    BEQ     .Lreturn
    
    LDR     R1, =checkbyte_from_52stack_etc
    BL      .Llinker
    
    CMP     R0, #1
    BNE     .Lloop

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lreturn:
    POP     {R0}
    BX      R0

.Llinker:
    BX      R1

@ End of function load_pokemenu_callback

@ -----------------------------------------------------------------------------
