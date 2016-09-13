# ___Pokémon Citrite: A ROM hack of Pokémon Emerald___

![Titlescreen](http://trinidad.cloud.securelateral.net/titlescreen.png)

This is an old repo of mine. __It is no longer maintained.__

You are free to use this repository in accordance with what is set out in the
LICENSE file in the root of this repository.

I hope you find what I have published of use. I put a lot of work into creating
this extensible system and developing it _properly,_ so it should be easy to
work around and port to other platforms as it is now.

## What is provided

1. A GNU Makefile that builds the ROM. It has various targets inside it that
   handle the compilation of images, Pokétext, map files, palette arrays, and
   of course GNU assembly and C code.
2. A collection of Python 3 scripts inside `util/` that provide pivotal
   functionality to the build system. This includes things like Pokétext
   conversion from UTF-8 to bytecode, the parsing of palette files, string
   manipulation for version incrementing, the insertion of hooks from a config
   holding symbol-offset pairs, and the conversion of binary blobs to GNU
   assembly along with their labelling and alignment. There is also a console
   patching utility that implements an extended version of the IPS patch
   format, however it is not bug-free and needs more testing.
3. Linker scripts for `ld` to use to properly hook things into our binary blob
   before it is inserted into the Emerald ROM.
4. Config files for VBA(-M/-SDL-H) to enable proper emulation of Emerald.
5. Various documents inside `doc/`, including the ARM7TDMI reference manual,
   a PokéScript command list exported from XSE, a movement code table for
   Emerald, and a Pokétext table for use in Hexecute and other binary editors.
6. A huge collection of media to do with Pokémon Citrite that you probably
   don’t care about. You’re welcome to look at it though. :P
