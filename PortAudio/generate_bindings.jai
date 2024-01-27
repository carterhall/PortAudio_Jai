#run {
  options := get_build_options();
  //print("build options: %\n", options);

  generate_bindings();
  set_build_options_dc(.{do_output=false});
}

generate_bindings :: () -> bool {
  output_filename: string;
  opts: Generate_Bindings_Options;

  using opts;

  #if OS == .WINDOWS {
    output_filename          = "portaudio_windows.jai";
  } else #if OS == .LINUX {
    output_filename          = "portaudio_linux.jai";
  } else #if OS == .MACOS {
    output_filename          = "portaudio_macos.jai";
  } else {
    assert(false);
  }

  // Cart: add a size_t definition, because jai doesn't include it (maybe just on Windows?)
  // There might be an option I need to set to do this better
  header_builder: String_Builder;
  init_string_builder(*header_builder);
  append(*header_builder, "size_t :: s64;\n");
  header = builder_to_string(*header_builder);

  #if OS == .WINDOWS {
    array_add(*libnames, "portaudio_static_x64");
    array_add(*libpaths, "./windows");

    // We need to link against some Windows libraries that Jai doesn't do by default.
    // I think the best way to do this is to add the Windows Kit's lib folder to the 
    // system_library_paths, and luckily Jai has a way to get this path easily.
    kit_root, windows_version := Windows_Resources.find_windows_kit_root();
    print("Found Windows Kit: %, %\n", kit_root, windows_version);

    kit_lib_path_builder: String_Builder;
    init_string_builder(*kit_lib_path_builder);
    append(*kit_lib_path_builder, kit_root);
    append(*kit_lib_path_builder, "\\um\\x64");
    kit_lib_path := builder_to_string(*kit_lib_path_builder);
    array_add(*system_library_paths, kit_lib_path);

    array_add(*system_library_names, "Uuid");
    array_add(*system_library_names, "Rpcrt4");
    array_add(*system_library_names, "dsound");
    array_add(*system_library_names, "winmm");
    array_add(*system_library_names, "Ole32");
    array_add(*system_library_names, "Setupapi"); 

  } else #if OS == .MACOS {
    array_add(*system_include_paths, "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include");
    array_add(*extra_clang_arguments, "-F/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/");

    // It is quite possible we are omitting some necessary frameworks here!
    array_add(*libnames, "AudioToolbox");
    array_add(*libnames, "CoreAudio");
    array_add(*libnames, "CoreFoundation");
    array_add(*libnames, "CoreServices");

    array_add(*libnames, "libportaudio");
    array_add(*libpaths, "./macos");

  } else #if OS == .LINUX{
    array_add(*libnames, "libportaudio");
    array_add(*libpaths, "./linux");
  }

  array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
  array_add(*source_files,  "../portaudio_src/include/portaudio.h");
  array_add(*extra_clang_arguments, "-x", "c++");
  strip_flags = 0;
  
  return generate_bindings(opts, output_filename);
}

#scope_file

#import "Basic";
#import "Compiler";
#import "BuildCpp";
#import "Check";
#import "Bindings_Generator";
#import "File";

#if OS == .WINDOWS {
  Windows_Resources :: #import "Windows_Resources";
}
