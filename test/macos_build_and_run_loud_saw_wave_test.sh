#!/bin/bash

# Remember to build the library with -DCMAKE_OSX_ARCHITECTURES="arm64;x86_64"

# To check the library's architectures
#   lipo -info path/to/libportaudio.a

clang ../portaudio_src/examples/paex_saw.c -arch x86_64 -I../portaudio_src/include ../build_macos/libportaudio.a -framework CoreFoundation -framework AudioToolbox -framework CoreAudio -framework CoreServices -o saw_macos.out
./saw_macos.out

