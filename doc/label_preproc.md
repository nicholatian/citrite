# ASM label preprocessor

Written by Alexander Nicholi

## General

`.asmx` files are just GNU assembly files that want to be preprocessed by the
Citrite Assembly Preprocessor (CAP).

## Local labels

Local labels are suffixed with a dollar sign (`$`), and during name mangling
are made relative to the nearest preceding global label.
