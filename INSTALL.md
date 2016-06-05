# Installation Guide

This document goes over how you can compile and run Pokémon Citrite for
yourself.

# Preparing the ROM

To create the hack, you need to provide a clean Emerald ROM to the
compilation entorage, preferably dumped by “TrashMan.” After you have obtained
a ROM, you can choose one of two methods for building the game.

## Method 1

Create a new directory named “rom”, and inside it place your Emerald ROM
exactly named “emer.gba”.

## Method 2

Edit the Makefile and change the `$(EMERALDROM)` variable to point to your
Emerald ROM. Be careful to escape special characters such as spaces, as the
build will fail if you don’t!

# __Windows:__ Gathering the prerequisites

- You will need to install the __devkitARM__ package from devkitPro, and ensure
  that the <code>C:\\path\\to\\devkitARM\\<b>arm-none-eabi\\bin</b></code>
  is in your `PATH` variable.
- You will also need Cygwin installed; the architecture doesn’t matter as it is
  only supplying Make and a POSIX environment.
- You will need Python 3 installed, preferably Python 3.5. `env` will ensure
  the scripts use Python 3.

# __GNU/Linux:__ Gathering the prerequisites

- You will need to install or compile the __devkitARM__ package from devkitPro,
  and add the location you installed it to plus `/arm-none-eabi/bin` to your
  `$PATH` variable.
- You will also need GNU Make, and Python 3. `env` will ensure the scripts use
  Python 3.

# Compiling

After changing directory into the repo’s root, just run `make` and it will
silently do all of the work of hacking in the entire game.

Once it’s finished, a ROM named `citrite.gba` will be available inside a newly
created `bin` directory, along with some other intermediary files (including an
`ELF` for debugging).
