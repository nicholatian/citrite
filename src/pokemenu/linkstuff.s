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

.file "pokemenu/linkstuff.s"
.ident "AS: (devkitARM release 45) 2.25.1"

@ ============================ S U B R O U T I N E ============================

.section .text
.balign 4
.thumb_func
.globl pokemenu_linkstuff

@ bool tscreen_sequence( void )

pokemenu_linkstuff:
    
    PUSH    {LR}
    LDR     R1, =checkbyte_from_52stack_etc
    BL      .Llinker
    
    CMP     R0, #0
    BEQ     .Lsetret_zero
    
    LDR     R1, =sub_08087598
    BL      .Llinker
    
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

@ End of function pokemenu_linkstuff

@ -----------------------------------------------------------------------------
