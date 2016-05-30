/*****************************************************************************\
 *                                                                           * 
 *   ########## ####### ######### ##########  ####### ######### ##########   * 
 *   ###    ###   ###   #  ###  # ###     ###   ###   #  ###  # ###    ###   * 
 *   ###          ###      ###    ###     ###   ###      ###    ###          * 
 *   ###          ###      ###    #########     ###      ###    #######      * 
 *   ###          ###      ###    ###   ###     ###      ###    ###          * 
 *   ###    ###   ###      ###    ###    ###    ###      ###    ###    ###   * 
 *   ########## #######    ###    ###     ### #######    ###    ##########   * 
 *                                                                           * 
 *                          Pokémon Citrite Version                          * 
 *                              OFFICIAL Source                              * 
 *                                                                           * 
 *                  Copyright © 2014-2016 Alexander Nicholi                  * 
 *                            All rights reserved                            * 
 *                                                                           * 
\*****************************************************************************/

OUTPUT_ARCH(arm)

MEMORY
{
    bios    : ORIGIN = 0x00000000, LENGTH = 16k
    ewram   : ORIGIN = 0x02000000, LENGTH = 256k
    iwram   : ORIGIN = 0x03000000, LENGTH = 32k
    io      : ORIGIN = 0x04000000, LENGTH = 1k - 1
    pal     : ORIGIN = 0x05000000, LENGTH = 1k
    vram    : ORIGIN = 0x06000000, LENGTH = 96k
    oam     : ORIGIN = 0x07000000, LENGTH = 1k
    rom     : ORIGIN = 0x08E3CF70, LENGTH = 32M - 0xE3CF70
}

SECTIONS
{
    .text :
    {
        FILL (0xABCD)
        
        __text_start = . ;
        *(.init)
        *(.text)
        *(.ctors)
        *(.dtors)
        *(.rodata)
        *(.fini)
        *(.data)
        *(COMMON)
        __text_end  = . ;
        
        __bss_start__ = . ;
        *(.bss)
        __bss_end__ = . ;
        _end = __bss_end__ ;
        __end__ = __bss_end__ ;
    } >rom = 0xFF
}
