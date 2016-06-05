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

.ifndef __GBA_MEMORY_S__
.equ __GBA_MEMORY_S__, 1

.equ io_dma0sad,   0x40000B0
.equ io_dma0dad,   0x40000B4
.equ io_dma0cnt_l, 0x40000B8
.equ io_dma0cnt_h, 0x40000BA
.equ io_dma1sad,   0x40000BC
.equ io_dma1dad,   0x40000C0
.equ io_dma1cnt_l, 0x40000C4
.equ io_dma1cnt_h, 0x40000C6
.equ io_dma2sad,   0x40000C8
.equ io_dma2dad,   0x40000CC
.equ io_dma2cnt_l, 0x40000D0
.equ io_dma2cnt_h, 0x40000D2
.equ io_dma3sad,   0x40000D4
.equ io_dma3dad,   0x40000D8
.equ io_dma3cnt_l, 0x40000DC
.equ io_dma3cnt_h, 0x40000DE

.endif @ __GBA_MEMORY_S__
