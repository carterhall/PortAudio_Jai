#!/bin/bash

# It's been a while since I looked at this file and I don't remember the exact setup you 
# need to build it. I'm hoping the toolchain included with Git Bash. Maybe VS's clang.

# Not sure if all these libs are needed, but it works. For now.

clang paex_saw.c -I../include ../../build_windows/Release/portaudio_static_x64.lib -lOle32 -lSetupapi -lgdi32 -lws2_32 -lshell32 -ladvapi32 -lUser32
