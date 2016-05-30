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

.file "pokemenu/prep.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ ============================ S U B R O U T I N E ============================

.section .text
.balign 4
.thumb_func
.globl pokemenu_prep

@ bool pokemenu_prep( void )

pokemenu_prep:
    
    PUSH    {LR}
    LDR     R1, =pokemenu_linkstuff
    BL      .Llinker
    
    CMP     R0, #1
    BEQ     .Lsetret_one
    
    LDR     R1, =checkbyte_from_5500stack
    BL      .Llinker
    
    CMP     R0, #1
    BNE     .Lsetret_zero

.Lsetret_one:
    MOVS    R0, #1
    B       .Lreturn

@ -----------------------------------------------------------------------------

.section .data
.balign 4, 0

.pool

.section .text
.balign 2
.thumb

.Lsetret_zero:
    MOVS    R0, #0

.Lreturn:
    POP     {R1}
    BX      R1

.Llinker:
    BX      R1

@ End of function pokemenu_prep

@ -----------------------------------------------------------------------------
