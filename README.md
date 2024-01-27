# PortAudio module for Jai

This repo is used to build PortAudio and generate Jai bindings for it. The actual Jai module, suitable for copying elsewhere, is the `PortAudio/` subdirectory.

This is all kind of a pain. We could ship prebuilt PortAudio binaries, but as I understand it, we can't ship it with ASIO support, because of Steinberg's license agreement.

### Getting PortAudio and ASIO

1. Download latest release from https://github.com/PortAudio/portaudio.

2. Rename the downloaded directory (`portaudio-v19.7.0` or similar) to `portaudio_src`, in the root directory of this repo.

3. [Download the ASIO SDK from Steinberg](https://www.steinberg.net/asiosdk) and **send them a signed license agreement** as described [here](https://www.steinberg.net/developers/) if you haven't already.

4. Put the downloaded SDK directory in `portaudio_src/src/hostapi/asio` and rename it to `ASIOSDK`.

### Building PortAudio

There are several options listed in the PortAudio documentation. I think the easiest way to build the static library with ASIO support on multiple operating systems is to just use cmake.

1. Make an OS-specific build directory, e.g. `build_mac`. `cd` into it.

2. Run `cmake ../portaudio_src`. (On macOS, pass the additional argument `-DCMAKE_OSX_ARCHITECTURES="arm64;x86_64"` to build a universal binary.)

3. Build using the OS-specific toolchain:

  - On macOS or (probably) Linux, simply `make`. This will build both dynamic and static versions.

  - On Windows, open `portaudio.sln` in Visual Studio. Select Release mode and x64 if they are not already selected, and build. This will put dynamic and static libs in `Release/`.

4. Copy the generated static library into the corresponding OS directory in the `PortAudio` folder (the final Jai module folder.)

### Testing the PortAudio build with examples

**WARNING: This example is very loud! Turn down your speakers!**

Look in `test/` for scripts that build and run some simple PortAudio examples. This is mainly for sanity checking the PortAudio build itself - nothing to do with Jai.

### Generating the Jai bindings

At this point, you're finally ready to `cd` into the PortAudio directory and run `jai generate_bindings.jai`. Hopefully this should work properly on Windows and macOS. It's not yet implemented for Linux, as of this first commit.

### Testing PortAudio from Jai

Once you have generated the bindings, you should be able to compile `PortAudio/test/test_portaudio.jai` and verify that you can get the PortAudio version.
