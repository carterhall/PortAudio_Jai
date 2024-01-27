//
// This file was auto-generated using the following command:
//
// jai generate_bindings.jai
//
size_t :: s64;



paNoDevice :: cast,trunc(PaDeviceIndex)-1;

paUseHostApiSpecificDeviceSpecification :: cast,trunc(PaDeviceIndex)-2;

paFloat32 :: cast(PaSampleFormat) 0x00000001;
paInt32 :: cast(PaSampleFormat) 0x00000002;
paInt24 :: cast(PaSampleFormat) 0x00000004;
paInt16 :: cast(PaSampleFormat) 0x00000008;
paInt8 :: cast(PaSampleFormat) 0x00000010;
paUInt8 :: cast(PaSampleFormat) 0x00000020;
paCustomFormat :: cast(PaSampleFormat) 0x00010000;

paNonInterleaved :: cast(PaSampleFormat) 0x80000000;

paFormatIsSupported :: 0;

paFramesPerBufferUnspecified :: 0;

paNoFlag :: cast(PaStreamFlags) 0;

paClipOff :: cast(PaStreamFlags) 0x00000001;

paDitherOff :: cast(PaStreamFlags) 0x00000002;

paNeverDropInput :: cast(PaStreamFlags) 0x00000004;

paPrimeOutputBuffersUsingStreamCallback :: cast(PaStreamFlags) 0x00000008;

paPlatformSpecificFlags :: cast(PaStreamFlags)0xFFFF0000;

paInputUnderflow :: cast(PaStreamCallbackFlags) 0x00000001;

paInputOverflow :: cast(PaStreamCallbackFlags) 0x00000002;

paOutputUnderflow :: cast(PaStreamCallbackFlags) 0x00000004;

paOutputOverflow :: cast(PaStreamCallbackFlags) 0x00000008;

paPrimingOutput :: cast(PaStreamCallbackFlags) 0x00000010;

/** Retrieve the release number of the currently running PortAudio build.
For example, for version "19.5.1" this will return 0x00130501.

@see paMakeVersionNumber
*/
Pa_GetVersion :: () -> s32 #foreign portaudio_static_x64;

/** Retrieve a textual description of the current PortAudio build,
e.g. "PortAudio V19.5.0-devel, revision 1952M".
The format of the text may change in the future. Do not try to parse the
returned string.

@deprecated As of 19.5.0, use Pa_GetVersionInfo()->versionText instead.
*/
Pa_GetVersionText :: () -> *u8 #foreign portaudio_static_x64;

/**
A structure containing PortAudio API version information.
@see Pa_GetVersionInfo, paMakeVersionNumber
@version Available as of 19.5.0.
*/
PaVersionInfo :: struct {
    versionMajor:           s32;
    versionMinor:           s32;
    versionSubMinor:        s32;

    /**
    This is currently the Git revision hash but may change in the future.
    The versionControlRevision is updated by running a script before compiling the library.
    If the update does not occur, this value may refer to an earlier revision.
    */
    versionControlRevision: *u8;

    /** Version as a string, for example "PortAudio V19.5.0-devel, revision 1952M" */
    versionText:            *u8;
}

/** Retrieve version information for the currently running PortAudio build.
@return A pointer to an immutable PaVersionInfo structure.

@note This function can be called at any time. It does not require PortAudio
to be initialized. The structure pointed to is statically allocated. Do not
attempt to free it or modify it.

@see PaVersionInfo, paMakeVersionNumber
@version Available as of 19.5.0.
*/
Pa_GetVersionInfo :: () -> *PaVersionInfo #foreign portaudio_static_x64;

/** Error codes returned by PortAudio functions.
Note that with the exception of paNoError, all PaErrorCodes are negative.
*/
PaError :: s32;
PaErrorCode :: enum s32 {
    NoError                               :: 0;

    NotInitialized                        :: -10000;
    UnanticipatedHostError                :: -9999;
    InvalidChannelCount                   :: -9998;
    InvalidSampleRate                     :: -9997;
    InvalidDevice                         :: -9996;
    InvalidFlag                           :: -9995;
    SampleFormatNotSupported              :: -9994;
    BadIODeviceCombination                :: -9993;
    InsufficientMemory                    :: -9992;
    BufferTooBig                          :: -9991;
    BufferTooSmall                        :: -9990;
    NullCallback                          :: -9989;
    BadStreamPtr                          :: -9988;
    TimedOut                              :: -9987;
    InternalError                         :: -9986;
    DeviceUnavailable                     :: -9985;
    IncompatibleHostApiSpecificStreamInfo :: -9984;
    StreamIsStopped                       :: -9983;
    StreamIsNotStopped                    :: -9982;
    InputOverflowed                       :: -9981;
    OutputUnderflowed                     :: -9980;
    HostApiNotFound                       :: -9979;
    InvalidHostApi                        :: -9978;
    CanNotReadFromACallbackStream         :: -9977;
    CanNotWriteToACallbackStream          :: -9976;
    CanNotReadFromAnOutputOnlyStream      :: -9975;
    CanNotWriteToAnInputOnlyStream        :: -9974;
    IncompatibleStreamHostApi             :: -9973;
    BadBufferPtr                          :: -9972;

    paNoError                               :: NoError;

    paNotInitialized                        :: NotInitialized;
    paUnanticipatedHostError                :: UnanticipatedHostError;
    paInvalidChannelCount                   :: InvalidChannelCount;
    paInvalidSampleRate                     :: InvalidSampleRate;
    paInvalidDevice                         :: InvalidDevice;
    paInvalidFlag                           :: InvalidFlag;
    paSampleFormatNotSupported              :: SampleFormatNotSupported;
    paBadIODeviceCombination                :: BadIODeviceCombination;
    paInsufficientMemory                    :: InsufficientMemory;
    paBufferTooBig                          :: BufferTooBig;
    paBufferTooSmall                        :: BufferTooSmall;
    paNullCallback                          :: NullCallback;
    paBadStreamPtr                          :: BadStreamPtr;
    paTimedOut                              :: TimedOut;
    paInternalError                         :: InternalError;
    paDeviceUnavailable                     :: DeviceUnavailable;
    paIncompatibleHostApiSpecificStreamInfo :: IncompatibleHostApiSpecificStreamInfo;
    paStreamIsStopped                       :: StreamIsStopped;
    paStreamIsNotStopped                    :: StreamIsNotStopped;
    paInputOverflowed                       :: InputOverflowed;
    paOutputUnderflowed                     :: OutputUnderflowed;
    paHostApiNotFound                       :: HostApiNotFound;
    paInvalidHostApi                        :: InvalidHostApi;
    paCanNotReadFromACallbackStream         :: CanNotReadFromACallbackStream;
    paCanNotWriteToACallbackStream          :: CanNotWriteToACallbackStream;
    paCanNotReadFromAnOutputOnlyStream      :: CanNotReadFromAnOutputOnlyStream;
    paCanNotWriteToAnInputOnlyStream        :: CanNotWriteToAnInputOnlyStream;
    paIncompatibleStreamHostApi             :: IncompatibleStreamHostApi;
    paBadBufferPtr                          :: BadBufferPtr;
}

/** Translate the supplied PortAudio error code into a human readable
message.
*/
Pa_GetErrorText :: (errorCode: PaError) -> *u8 #foreign portaudio_static_x64;

/** Library initialization function - call this before using PortAudio.
This function initializes internal data structures and prepares underlying
host APIs for use.  With the exception of Pa_GetVersion(), Pa_GetVersionText(),
and Pa_GetErrorText(), this function MUST be called before using any other
PortAudio API functions.

If Pa_Initialize() is called multiple times, each successful
call must be matched with a corresponding call to Pa_Terminate().
Pairs of calls to Pa_Initialize()/Pa_Terminate() may overlap, and are not
required to be fully nested.

Note that if Pa_Initialize() returns an error code, Pa_Terminate() should
NOT be called.

@return paNoError if successful, otherwise an error code indicating the cause
of failure.

@see Pa_Terminate
*/
Pa_Initialize :: () -> PaError #foreign portaudio_static_x64;

/** Library termination function - call this when finished using PortAudio.
This function deallocates all resources allocated by PortAudio since it was
initialized by a call to Pa_Initialize(). In cases where Pa_Initialise() has
been called multiple times, each call must be matched with a corresponding call
to Pa_Terminate(). The final matching call to Pa_Terminate() will automatically
close any PortAudio streams that are still open.

Pa_Terminate() MUST be called before exiting a program which uses PortAudio.
Failure to do so may result in serious resource leaks, such as audio devices
not being available until the next reboot.

@return paNoError if successful, otherwise an error code indicating the cause
of failure.

@see Pa_Initialize
*/
Pa_Terminate :: () -> PaError #foreign portaudio_static_x64;

/** The type used to refer to audio devices. Values of this type usually
range from 0 to (Pa_GetDeviceCount()-1), and may also take on the PaNoDevice
and paUseHostApiSpecificDeviceSpecification values.

@see Pa_GetDeviceCount, paNoDevice, paUseHostApiSpecificDeviceSpecification
*/
PaDeviceIndex :: s32;

/** The type used to enumerate to host APIs at runtime. Values of this type
range from 0 to (Pa_GetHostApiCount()-1).

@see Pa_GetHostApiCount
*/
PaHostApiIndex :: s32;

/** Retrieve the number of available host APIs. Even if a host API is
available it may have no devices available.

@return A non-negative value indicating the number of available host APIs
or, a PaErrorCode (which are always negative) if PortAudio is not initialized
or an error is encountered.

@see PaHostApiIndex
*/
Pa_GetHostApiCount :: () -> PaHostApiIndex #foreign portaudio_static_x64;

/** Retrieve the index of the default host API. The default host API will be
the lowest common denominator host API on the current platform and is
unlikely to provide the best performance.

@return A non-negative value ranging from 0 to (Pa_GetHostApiCount()-1)
indicating the default host API index or, a PaErrorCode (which are always
negative) if PortAudio is not initialized or an error is encountered.
*/
Pa_GetDefaultHostApi :: () -> PaHostApiIndex #foreign portaudio_static_x64;

/** Unchanging unique identifiers for each supported host API. This type
is used in the PaHostApiInfo structure. The values are guaranteed to be
unique and to never change, thus allowing code to be written that
conditionally uses host API specific extensions.

New type ids will be allocated when support for a host API reaches
"public alpha" status, prior to that developers should use the
paInDevelopment type id.

@see PaHostApiInfo
*/
PaHostApiTypeId :: enum s32 {
    InDevelopment   :: 0;
    DirectSound     :: 1;
    MME             :: 2;
    ASIO            :: 3;
    SoundManager    :: 4;
    CoreAudio       :: 5;
    OSS             :: 7;
    ALSA            :: 8;
    AL              :: 9;
    BeOS            :: 10;
    WDMKS           :: 11;
    JACK            :: 12;
    WASAPI          :: 13;
    AudioScienceHPI :: 14;

    paInDevelopment   :: InDevelopment;
    paDirectSound     :: DirectSound;
    paMME             :: MME;
    paASIO            :: ASIO;
    paSoundManager    :: SoundManager;
    paCoreAudio       :: CoreAudio;
    paOSS             :: OSS;
    paALSA            :: ALSA;
    paAL              :: AL;
    paBeOS            :: BeOS;
    paWDMKS           :: WDMKS;
    paJACK            :: JACK;
    paWASAPI          :: WASAPI;
    paAudioScienceHPI :: AudioScienceHPI;
}

/** A structure containing information about a particular host API. */
PaHostApiInfo :: struct {
    /** this is struct version 1 */
    structVersion:       s32;

    /** The well known unique identifier of this host API @see PaHostApiTypeId */
    type:                PaHostApiTypeId;

    /** A textual description of the host API for display on user interfaces. */
    name:                *u8;

    /**  The number of devices belonging to this host API. This field may be
    used in conjunction with Pa_HostApiDeviceIndexToDeviceIndex() to enumerate
    all devices for this host API.
    @see Pa_HostApiDeviceIndexToDeviceIndex
    */
    deviceCount:         s32;

    /** The default input device for this host API. The value will be a
    device index ranging from 0 to (Pa_GetDeviceCount()-1), or paNoDevice
    if no default input device is available.
    */
    defaultInputDevice:  PaDeviceIndex;

    /** The default output device for this host API. The value will be a
    device index ranging from 0 to (Pa_GetDeviceCount()-1), or paNoDevice
    if no default output device is available.
    */
    defaultOutputDevice: PaDeviceIndex;
}

/** Retrieve a pointer to a structure containing information about a specific
host Api.

@param hostApi A valid host API index ranging from 0 to (Pa_GetHostApiCount()-1)

@return A pointer to an immutable PaHostApiInfo structure describing
a specific host API. If the hostApi parameter is out of range or an error
is encountered, the function returns NULL.

The returned structure is owned by the PortAudio implementation and must not
be manipulated or freed. The pointer is only guaranteed to be valid between
calls to Pa_Initialize() and Pa_Terminate().
*/
Pa_GetHostApiInfo :: (hostApi: PaHostApiIndex) -> *PaHostApiInfo #foreign portaudio_static_x64;

/** Convert a static host API unique identifier, into a runtime
host API index.

@param type A unique host API identifier belonging to the PaHostApiTypeId
enumeration.

@return A valid PaHostApiIndex ranging from 0 to (Pa_GetHostApiCount()-1) or,
a PaErrorCode (which are always negative) if PortAudio is not initialized
or an error is encountered.

The paHostApiNotFound error code indicates that the host API specified by the
type parameter is not available.

@see PaHostApiTypeId
*/
Pa_HostApiTypeIdToHostApiIndex :: (type: PaHostApiTypeId) -> PaHostApiIndex #foreign portaudio_static_x64;

/** Convert a host-API-specific device index to standard PortAudio device index.
This function may be used in conjunction with the deviceCount field of
PaHostApiInfo to enumerate all devices for the specified host API.

@param hostApi A valid host API index ranging from 0 to (Pa_GetHostApiCount()-1)

@param hostApiDeviceIndex A valid per-host device index in the range
0 to (Pa_GetHostApiInfo(hostApi)->deviceCount-1)

@return A non-negative PaDeviceIndex ranging from 0 to (Pa_GetDeviceCount()-1)
or, a PaErrorCode (which are always negative) if PortAudio is not initialized
or an error is encountered.

A paInvalidHostApi error code indicates that the host API index specified by
the hostApi parameter is out of range.

A paInvalidDevice error code indicates that the hostApiDeviceIndex parameter
is out of range.

@see PaHostApiInfo
*/
Pa_HostApiDeviceIndexToDeviceIndex :: (hostApi: PaHostApiIndex, hostApiDeviceIndex: s32) -> PaDeviceIndex #foreign portaudio_static_x64;

/** Structure used to return information about a host error condition.
*/
PaHostErrorInfo :: struct {
    hostApiType: PaHostApiTypeId; /**< the host API which returned the error code */
    errorCode:   s32; /**< the error code returned */
    errorText:   *u8; /**< a textual description of the error if available, otherwise a zero-length string */
}

/** Return information about the last host error encountered. The error
information returned by Pa_GetLastHostErrorInfo() will never be modified
asynchronously by errors occurring in other PortAudio owned threads
(such as the thread that manages the stream callback.)

This function is provided as a last resort, primarily to enhance debugging
by providing clients with access to all available error information.

@return A pointer to an immutable structure constraining information about
the host error. The values in this structure will only be valid if a
PortAudio function has previously returned the paUnanticipatedHostError
error code.
*/
Pa_GetLastHostErrorInfo :: () -> *PaHostErrorInfo #foreign portaudio_static_x64;

/** Retrieve the number of available devices. The number of available devices
may be zero.

@return A non-negative value indicating the number of available devices or,
a PaErrorCode (which are always negative) if PortAudio is not initialized
or an error is encountered.
*/
Pa_GetDeviceCount :: () -> PaDeviceIndex #foreign portaudio_static_x64;

/** Retrieve the index of the default input device. The result can be
used in the inputDevice parameter to Pa_OpenStream().

@return The default input device index for the default host API, or paNoDevice
if no default input device is available or an error was encountered.
*/
Pa_GetDefaultInputDevice :: () -> PaDeviceIndex #foreign portaudio_static_x64;

/** Retrieve the index of the default output device. The result can be
used in the outputDevice parameter to Pa_OpenStream().

@return The default output device index for the default host API, or paNoDevice
if no default output device is available or an error was encountered.

@note
On the PC, the user can specify a default device by
setting an environment variable. For example, to use device #1.
<pre>
set PA_RECOMMENDED_OUTPUT_DEVICE=1
</pre>
The user should first determine the available device ids by using
the supplied application "pa_devs".
*/
Pa_GetDefaultOutputDevice :: () -> PaDeviceIndex #foreign portaudio_static_x64;

/** The type used to represent monotonic time in seconds. PaTime is
used for the fields of the PaStreamCallbackTimeInfo argument to the
PaStreamCallback and as the result of Pa_GetStreamTime().

PaTime values have unspecified origin.

@see PaStreamCallback, PaStreamCallbackTimeInfo, Pa_GetStreamTime
*/
PaTime :: float64;

/** A type used to specify one or more sample formats. Each value indicates
a possible format for sound data passed to and from the stream callback,
Pa_ReadStream and Pa_WriteStream.

The standard formats paFloat32, paInt16, paInt32, paInt24, paInt8
and aUInt8 are usually implemented by all implementations.

The floating point representation (paFloat32) uses +1.0 and -1.0 as the
maximum and minimum respectively.

paUInt8 is an unsigned 8 bit format where 128 is considered "ground"

The paNonInterleaved flag indicates that audio data is passed as an array
of pointers to separate buffers, one buffer for each channel. Usually,
when this flag is not used, audio data is passed as a single buffer with
all channels interleaved.

@see Pa_OpenStream, Pa_OpenDefaultStream, PaDeviceInfo
@see paFloat32, paInt16, paInt32, paInt24, paInt8
@see paUInt8, paCustomFormat, paNonInterleaved
*/
PaSampleFormat :: u32;

/** A structure providing information and capabilities of PortAudio devices.
Devices may support input, output or both input and output.
*/
PaDeviceInfo :: struct {
    structVersion:            s32; /* this is struct version 2 */
    name:                     *u8;
    hostApi:                  PaHostApiIndex; /**< note this is a host API index, not a type id*/

    maxInputChannels:         s32;
    maxOutputChannels:        s32;

    /** Default latency values for interactive performance. */
    defaultLowInputLatency:   PaTime;
    defaultLowOutputLatency:  PaTime;

    /** Default latency values for robust non-interactive applications (eg. playing sound files). */
    defaultHighInputLatency:  PaTime;
    defaultHighOutputLatency: PaTime;

    defaultSampleRate:        float64;
}

/** Retrieve a pointer to a PaDeviceInfo structure containing information
about the specified device.
@return A pointer to an immutable PaDeviceInfo structure. If the device
parameter is out of range the function returns NULL.

@param device A valid device index in the range 0 to (Pa_GetDeviceCount()-1)

@note PortAudio manages the memory referenced by the returned pointer,
the client must not manipulate or free the memory. The pointer is only
guaranteed to be valid between calls to Pa_Initialize() and Pa_Terminate().

@see PaDeviceInfo, PaDeviceIndex
*/
Pa_GetDeviceInfo :: (device: PaDeviceIndex) -> *PaDeviceInfo #foreign portaudio_static_x64;

/** Parameters for one direction (input or output) of a stream.
*/
PaStreamParameters :: struct {
    /** A valid device index in the range 0 to (Pa_GetDeviceCount()-1)
    specifying the device to be used or the special constant
    paUseHostApiSpecificDeviceSpecification which indicates that the actual
    device(s) to use are specified in hostApiSpecificStreamInfo.
    This field must not be set to paNoDevice.
    */
    device:                    PaDeviceIndex;

    /** The number of channels of sound to be delivered to the
    stream callback or accessed by Pa_ReadStream() or Pa_WriteStream().
    It can range from 1 to the value of maxInputChannels in the
    PaDeviceInfo record for the device specified by the device parameter.
    */
    channelCount:              s32;

    /** The sample format of the buffer provided to the stream callback,
    a_ReadStream() or Pa_WriteStream(). It may be any of the formats described
    by the PaSampleFormat enumeration.
    */
    sampleFormat:              PaSampleFormat;

    /** The desired latency in seconds. Where practical, implementations should
    configure their latency based on these parameters, otherwise they may
    choose the closest viable latency instead. Unless the suggested latency
    is greater than the absolute upper limit for the device implementations
    should round the suggestedLatency up to the next practical value - ie to
    provide an equal or higher latency than suggestedLatency wherever possible.
    Actual latency values for an open stream may be retrieved using the
    inputLatency and outputLatency fields of the PaStreamInfo structure
    returned by Pa_GetStreamInfo().
    @see default*Latency in PaDeviceInfo, *Latency in PaStreamInfo
    */
    suggestedLatency:          PaTime;

    /** An optional pointer to a host api specific data structure
    containing additional information for device setup and/or stream processing.
    hostApiSpecificStreamInfo is never required for correct operation,
    if not used it should be set to NULL.
    */
    hostApiSpecificStreamInfo: *void;
}

/** Determine whether it would be possible to open a stream with the specified
parameters.

@param inputParameters A structure that describes the input parameters used to
open a stream. The suggestedLatency field is ignored. See PaStreamParameters
for a description of these parameters. inputParameters must be NULL for
output-only streams.

@param outputParameters A structure that describes the output parameters used
to open a stream. The suggestedLatency field is ignored. See PaStreamParameters
for a description of these parameters. outputParameters must be NULL for
input-only streams.

@param sampleRate The required sampleRate. For full-duplex streams it is the
sample rate for both input and output

@return Returns 0 if the format is supported, and an error code indicating why
the format is not supported otherwise. The constant paFormatIsSupported is
provided to compare with the return value for success.

@see paFormatIsSupported, PaStreamParameters
*/
Pa_IsFormatSupported :: (inputParameters: *PaStreamParameters, outputParameters: *PaStreamParameters, sampleRate: float64) -> PaError #foreign portaudio_static_x64;

/**
A single PaStream can provide multiple channels of real-time
streaming audio input and output to a client application. A stream
provides access to audio hardware represented by one or more
PaDevices. Depending on the underlying Host API, it may be possible
to open multiple streams using the same device, however this behavior
is implementation defined. Portable applications should assume that
a PaDevice may be simultaneously used by at most one PaStream.

Pointers to PaStream objects are passed between PortAudio functions that
operate on streams.

@see Pa_OpenStream, Pa_OpenDefaultStream, Pa_OpenDefaultStream, Pa_CloseStream,
Pa_StartStream, Pa_StopStream, Pa_AbortStream, Pa_IsStreamActive,
Pa_GetStreamTime, Pa_GetStreamCpuLoad

*/
PaStream :: void;

/** Flags used to control the behavior of a stream. They are passed as
parameters to Pa_OpenStream or Pa_OpenDefaultStream. Multiple flags may be
ORed together.

@see Pa_OpenStream, Pa_OpenDefaultStream
@see paNoFlag, paClipOff, paDitherOff, paNeverDropInput,
paPrimeOutputBuffersUsingStreamCallback, paPlatformSpecificFlags
*/
PaStreamFlags :: u32;

/**
Timing information for the buffers passed to the stream callback.

Time values are expressed in seconds and are synchronised with the time base used by Pa_GetStreamTime() for the associated stream.

@see PaStreamCallback, Pa_GetStreamTime
*/
PaStreamCallbackTimeInfo :: struct {
    inputBufferAdcTime:  PaTime; /**< The time when the first sample of the input buffer was captured at the ADC input */
    currentTime:         PaTime; /**< The time when the stream callback was invoked */
    outputBufferDacTime: PaTime; /**< The time when the first sample of the output buffer will output the DAC */
}

/**
Flag bit constants for the statusFlags to PaStreamCallback.

@see paInputUnderflow, paInputOverflow, paOutputUnderflow, paOutputOverflow,
paPrimingOutput
*/
PaStreamCallbackFlags :: u32;

/**
Allowable return values for the PaStreamCallback.
@see PaStreamCallback
*/
PaStreamCallbackResult :: enum s32 {
    Continue :: 0;
    Complete :: 1;
    Abort    :: 2;

    paContinue :: Continue;
    paComplete :: Complete;
    paAbort    :: Abort;
}

/**
Functions of type PaStreamCallback are implemented by PortAudio clients.
They consume, process or generate audio in response to requests from an
active PortAudio stream.

When a stream is running, PortAudio calls the stream callback periodically.
The callback function is responsible for processing buffers of audio samples
passed via the input and output parameters.

The PortAudio stream callback runs at very high or real-time priority.
It is required to consistently meet its time deadlines. Do not allocate
memory, access the file system, call library functions or call other functions
from the stream callback that may block or take an unpredictable amount of
time to complete.

In order for a stream to maintain glitch-free operation the callback
must consume and return audio data faster than it is recorded and/or
played. PortAudio anticipates that each callback invocation may execute for
a duration approaching the duration of frameCount audio frames at the stream
sample rate. It is reasonable to expect to be able to utilise 70% or more of
the available CPU time in the PortAudio callback. However, due to buffer size
adaption and other factors, not all host APIs are able to guarantee audio
stability under heavy CPU load with arbitrary fixed callback buffer sizes.
When high callback CPU utilisation is required the most robust behavior
can be achieved by using paFramesPerBufferUnspecified as the
Pa_OpenStream() framesPerBuffer parameter.

@param input and @param output are either arrays of interleaved samples or;
if non-interleaved samples were requested using the paNonInterleaved sample
format flag, an array of buffer pointers, one non-interleaved buffer for
each channel.

The format, packing and number of channels used by the buffers are
determined by parameters to Pa_OpenStream().

@param frameCount The number of sample frames to be processed by
the stream callback.

@param timeInfo Timestamps indicating the ADC capture time of the first sample
in the input buffer, the DAC output time of the first sample in the output buffer
and the time the callback was invoked.
See PaStreamCallbackTimeInfo and Pa_GetStreamTime()

@param statusFlags Flags indicating whether input and/or output buffers
have been inserted or will be dropped to overcome underflow or overflow
conditions.

@param userData The value of a user supplied pointer passed to
Pa_OpenStream() intended for storing synthesis data etc.

@return
The stream callback should return one of the values in the
::PaStreamCallbackResult enumeration. To ensure that the callback continues
to be called, it should return paContinue (0). Either paComplete or paAbort
can be returned to finish stream processing, after either of these values is
returned the callback will not be called again. If paAbort is returned the
stream will finish as soon as possible. If paComplete is returned, the stream
will continue until all buffers generated by the callback have been played.
This may be useful in applications such as soundfile players where a specific
duration of output is required. However, it is not necessary to utilize this
mechanism as Pa_StopStream(), Pa_AbortStream() or Pa_CloseStream() can also
be used to stop the stream. The callback must always fill the entire output
buffer irrespective of its return value.

@see Pa_OpenStream, Pa_OpenDefaultStream

@note With the exception of Pa_GetStreamCpuLoad() it is not permissible to call
PortAudio API functions from within the stream callback.
*/
PaStreamCallback :: #type (input: *void, output: *void, frameCount: u32, timeInfo: *PaStreamCallbackTimeInfo, statusFlags: PaStreamCallbackFlags, userData: *void) -> s32 #c_call;

/** Opens a stream for either input, output or both.

@param stream The address of a PaStream pointer which will receive
a pointer to the newly opened stream.

@param inputParameters A structure that describes the input parameters used by
the opened stream. See PaStreamParameters for a description of these parameters.
inputParameters must be NULL for output-only streams.

@param outputParameters A structure that describes the output parameters used by
the opened stream. See PaStreamParameters for a description of these parameters.
outputParameters must be NULL for input-only streams.

@param sampleRate The desired sampleRate. For full-duplex streams it is the
sample rate for both input and output. Note that the actual sampleRate
may differ very slightly from the desired rate because of hardware limitations.
The exact rate can be queried using Pa_GetStreamInfo(). If nothing close
to the desired sampleRate is available then the open will fail and return an error.

@param framesPerBuffer The number of frames passed to the stream callback
function, or the preferred block granularity for a blocking read/write stream.
The special value paFramesPerBufferUnspecified (0) may be used to request that
the stream callback will receive an optimal (and possibly varying) number of
frames based on host requirements and the requested latency settings.
Note: With some host APIs, the use of non-zero framesPerBuffer for a callback
stream may introduce an additional layer of buffering which could introduce
additional latency. PortAudio guarantees that the additional latency
will be kept to the theoretical minimum however, it is strongly recommended
that a non-zero framesPerBuffer value only be used when your algorithm
requires a fixed number of frames per stream callback.

@param streamFlags Flags which modify the behavior of the streaming process.
This parameter may contain a combination of flags ORed together. Some flags may
only be relevant to certain buffer formats.

@param streamCallback A pointer to a client supplied function that is responsible
for processing and filling input and output buffers. If this parameter is NULL
the stream will be opened in 'blocking read/write' mode. In blocking mode,
the client can receive sample data using Pa_ReadStream and write sample data
using Pa_WriteStream, the number of samples that may be read or written
without blocking is returned by Pa_GetStreamReadAvailable and
Pa_GetStreamWriteAvailable respectively.

@param userData A client supplied pointer which is passed to the stream callback
function. It could for example, contain a pointer to instance data necessary
for processing the audio buffers. This parameter is ignored if streamCallback
is NULL.

@return
Upon success Pa_OpenStream() returns paNoError and places a pointer to a
valid PaStream in the stream argument. The stream is inactive (stopped).
If a call to Pa_OpenStream() fails, a non-zero error code is returned (see
PaError for possible error codes) and the value of stream is invalid.

@see PaStreamParameters, PaStreamCallback, Pa_ReadStream, Pa_WriteStream,
Pa_GetStreamReadAvailable, Pa_GetStreamWriteAvailable
*/
Pa_OpenStream :: (stream: **PaStream, inputParameters: *PaStreamParameters, outputParameters: *PaStreamParameters, sampleRate: float64, framesPerBuffer: u32, streamFlags: PaStreamFlags, streamCallback: PaStreamCallback, userData: *void) -> PaError #foreign portaudio_static_x64;

/** A simplified version of Pa_OpenStream() that opens the default input
and/or output devices.

@param stream The address of a PaStream pointer which will receive
a pointer to the newly opened stream.

@param numInputChannels  The number of channels of sound that will be supplied
to the stream callback or returned by Pa_ReadStream. It can range from 1 to
the value of maxInputChannels in the PaDeviceInfo record for the default input
device. If 0 the stream is opened as an output-only stream.

@param numOutputChannels The number of channels of sound to be delivered to the
stream callback or passed to Pa_WriteStream. It can range from 1 to the value
of maxOutputChannels in the PaDeviceInfo record for the default output device.
If 0 the stream is opened as an output-only stream.

@param sampleFormat The sample format of both the input and output buffers
provided to the callback or passed to and from Pa_ReadStream and Pa_WriteStream.
sampleFormat may be any of the formats described by the PaSampleFormat
enumeration.

@param sampleRate Same as Pa_OpenStream parameter of the same name.
@param framesPerBuffer Same as Pa_OpenStream parameter of the same name.
@param streamCallback Same as Pa_OpenStream parameter of the same name.
@param userData Same as Pa_OpenStream parameter of the same name.

@return As for Pa_OpenStream

@see Pa_OpenStream, PaStreamCallback
*/
Pa_OpenDefaultStream :: (stream: **PaStream, numInputChannels: s32, numOutputChannels: s32, sampleFormat: PaSampleFormat, sampleRate: float64, framesPerBuffer: u32, streamCallback: PaStreamCallback, userData: *void) -> PaError #foreign portaudio_static_x64;

/** Closes an audio stream. If the audio stream is active it
discards any pending buffers as if Pa_AbortStream() had been called.
*/
Pa_CloseStream :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** Functions of type PaStreamFinishedCallback are implemented by PortAudio
clients. They can be registered with a stream using the Pa_SetStreamFinishedCallback
function. Once registered they are called when the stream becomes inactive
(ie once a call to Pa_StopStream() will not block).
A stream will become inactive after the stream callback returns non-zero,
or when Pa_StopStream or Pa_AbortStream is called. For a stream providing audio
output, if the stream callback returns paComplete, or Pa_StopStream() is called,
the stream finished callback will not be called until all generated sample data
has been played.

@param userData The userData parameter supplied to Pa_OpenStream()

@see Pa_SetStreamFinishedCallback
*/
PaStreamFinishedCallback :: #type (userData: *void) -> void #c_call;

/** Register a stream finished callback function which will be called when the
stream becomes inactive. See the description of PaStreamFinishedCallback for
further details about when the callback will be called.

@param stream a pointer to a PaStream that is in the stopped state - if the
stream is not stopped, the stream's finished callback will remain unchanged
and an error code will be returned.

@param streamFinishedCallback a pointer to a function with the same signature
as PaStreamFinishedCallback, that will be called when the stream becomes
inactive. Passing NULL for this parameter will un-register a previously
registered stream finished callback function.

@return on success returns paNoError, otherwise an error code indicating the cause
of the error.

@see PaStreamFinishedCallback
*/
Pa_SetStreamFinishedCallback :: (stream: *PaStream, streamFinishedCallback: PaStreamFinishedCallback) -> PaError #foreign portaudio_static_x64;

/** Commences audio processing.
*/
Pa_StartStream :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** Terminates audio processing. It waits until all pending
audio buffers have been played before it returns.
*/
Pa_StopStream :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** Terminates audio processing immediately without waiting for pending
buffers to complete.
*/
Pa_AbortStream :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** Determine whether the stream is stopped.
A stream is considered to be stopped prior to a successful call to
Pa_StartStream and after a successful call to Pa_StopStream or Pa_AbortStream.
If a stream callback returns a value other than paContinue the stream is NOT
considered to be stopped.

@return Returns one (1) when the stream is stopped, zero (0) when
the stream is running or, a PaErrorCode (which are always negative) if
PortAudio is not initialized or an error is encountered.

@see Pa_StopStream, Pa_AbortStream, Pa_IsStreamActive
*/
Pa_IsStreamStopped :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** Determine whether the stream is active.
A stream is active after a successful call to Pa_StartStream(), until it
becomes inactive either as a result of a call to Pa_StopStream() or
Pa_AbortStream(), or as a result of a return value other than paContinue from
the stream callback. In the latter case, the stream is considered inactive
after the last buffer has finished playing.

@return Returns one (1) when the stream is active (ie playing or recording
audio), zero (0) when not playing or, a PaErrorCode (which are always negative)
if PortAudio is not initialized or an error is encountered.

@see Pa_StopStream, Pa_AbortStream, Pa_IsStreamStopped
*/
Pa_IsStreamActive :: (stream: *PaStream) -> PaError #foreign portaudio_static_x64;

/** A structure containing unchanging information about an open stream.
@see Pa_GetStreamInfo
*/
PaStreamInfo :: struct {
    /** this is struct version 1 */
    structVersion: s32;

    /** The input latency of the stream in seconds. This value provides the most
    accurate estimate of input latency available to the implementation. It may
    differ significantly from the suggestedLatency value passed to Pa_OpenStream().
    The value of this field will be zero (0.) for output-only streams.
    @see PaTime
    */
    inputLatency:  PaTime;

    /** The output latency of the stream in seconds. This value provides the most
    accurate estimate of output latency available to the implementation. It may
    differ significantly from the suggestedLatency value passed to Pa_OpenStream().
    The value of this field will be zero (0.) for input-only streams.
    @see PaTime
    */
    outputLatency: PaTime;

    /** The sample rate of the stream in Hertz (samples per second). In cases
    where the hardware sample rate is inaccurate and PortAudio is aware of it,
    the value of this field may be different from the sampleRate parameter
    passed to Pa_OpenStream(). If information about the actual hardware sample
    rate is not available, this field will have the same value as the sampleRate
    parameter passed to Pa_OpenStream().
    */
    sampleRate:    float64;
}

/** Retrieve a pointer to a PaStreamInfo structure containing information
about the specified stream.
@return A pointer to an immutable PaStreamInfo structure. If the stream
parameter is invalid, or an error is encountered, the function returns NULL.

@param stream A pointer to an open stream previously created with Pa_OpenStream.

@note PortAudio manages the memory referenced by the returned pointer,
the client must not manipulate or free the memory. The pointer is only
guaranteed to be valid until the specified stream is closed.

@see PaStreamInfo
*/
Pa_GetStreamInfo :: (stream: *PaStream) -> *PaStreamInfo #foreign portaudio_static_x64;

/** Returns the current time in seconds for a stream according to the same clock used
to generate callback PaStreamCallbackTimeInfo timestamps. The time values are
monotonically increasing and have unspecified origin.

Pa_GetStreamTime returns valid time values for the entire life of the stream,
from when the stream is opened until it is closed. Starting and stopping the stream
does not affect the passage of time returned by Pa_GetStreamTime.

This time may be used for synchronizing other events to the audio stream, for
example synchronizing audio to MIDI.

@return The stream's current time in seconds, or 0 if an error occurred.

@see PaTime, PaStreamCallback, PaStreamCallbackTimeInfo
*/
Pa_GetStreamTime :: (stream: *PaStream) -> PaTime #foreign portaudio_static_x64;

/** Retrieve CPU usage information for the specified stream.
The "CPU Load" is a fraction of total CPU time consumed by a callback stream's
audio processing routines including, but not limited to the client supplied
stream callback. This function does not work with blocking read/write streams.

This function may be called from the stream callback function or the
application.

@return
A floating point value, typically between 0.0 and 1.0, where 1.0 indicates
that the stream callback is consuming the maximum number of CPU cycles possible
to maintain real-time operation. A value of 0.5 would imply that PortAudio and
the stream callback was consuming roughly 50% of the available CPU time. The
return value may exceed 1.0. A value of 0.0 will always be returned for a
blocking read/write stream, or if an error occurs.
*/
Pa_GetStreamCpuLoad :: (stream: *PaStream) -> float64 #foreign portaudio_static_x64;

/** Read samples from an input stream. The function doesn't return until
the entire buffer has been filled - this may involve waiting for the operating
system to supply the data.

@param stream A pointer to an open stream previously created with Pa_OpenStream.

@param buffer A pointer to a buffer of sample frames. The buffer contains
samples in the format specified by the inputParameters->sampleFormat field
used to open the stream, and the number of channels specified by
inputParameters->numChannels. If non-interleaved samples were requested using
the paNonInterleaved sample format flag, buffer is a pointer to the first element
of an array of buffer pointers, one non-interleaved buffer for each channel.

@param frames The number of frames to be read into buffer. This parameter
is not constrained to a specific range, however high performance applications
will want to match this parameter to the framesPerBuffer parameter used
when opening the stream.

@return On success PaNoError will be returned, or PaInputOverflowed if input
data was discarded by PortAudio after the previous call and before this call.
*/
Pa_ReadStream :: (stream: *PaStream, buffer: *void, frames: u32) -> PaError #foreign portaudio_static_x64;

/** Write samples to an output stream. This function doesn't return until the
entire buffer has been written - this may involve waiting for the operating
system to consume the data.

@param stream A pointer to an open stream previously created with Pa_OpenStream.

@param buffer A pointer to a buffer of sample frames. The buffer contains
samples in the format specified by the outputParameters->sampleFormat field
used to open the stream, and the number of channels specified by
outputParameters->numChannels. If non-interleaved samples were requested using
the paNonInterleaved sample format flag, buffer is a pointer to the first element
of an array of buffer pointers, one non-interleaved buffer for each channel.

@param frames The number of frames to be written from buffer. This parameter
is not constrained to a specific range, however high performance applications
will want to match this parameter to the framesPerBuffer parameter used
when opening the stream.

@return On success PaNoError will be returned, or paOutputUnderflowed if
additional output data was inserted after the previous call and before this
call.
*/
Pa_WriteStream :: (stream: *PaStream, buffer: *void, frames: u32) -> PaError #foreign portaudio_static_x64;

/** Retrieve the number of frames that can be read from the stream without
waiting.

@return Returns a non-negative value representing the maximum number of frames
that can be read from the stream without blocking or busy waiting or, a
PaErrorCode (which are always negative) if PortAudio is not initialized or an
error is encountered.
*/
Pa_GetStreamReadAvailable :: (stream: *PaStream) -> s32 #foreign portaudio_static_x64;

/** Retrieve the number of frames that can be written to the stream without
waiting.

@return Returns a non-negative value representing the maximum number of frames
that can be written to the stream without blocking or busy waiting or, a
PaErrorCode (which are always negative) if PortAudio is not initialized or an
error is encountered.
*/
Pa_GetStreamWriteAvailable :: (stream: *PaStream) -> s32 #foreign portaudio_static_x64;

/** Retrieve the size of a given sample format in bytes.

@return The size in bytes of a single sample in the specified format,
or paSampleFormatNotSupported if the format is not supported.
*/
Pa_GetSampleSize :: (format: PaSampleFormat) -> PaError #foreign portaudio_static_x64;

/** Put the caller to sleep for at least 'msec' milliseconds. This function is
provided only as a convenience for authors of portable code (such as the tests
and examples in the PortAudio distribution.)

The function may sleep longer than requested so don't rely on this for accurate
musical timing.
*/
Pa_Sleep :: (msec: s32) -> void #foreign portaudio_static_x64;

#scope_file

#import "Basic"; // For assert

portaudio_static_x64 :: #library,no_dll "./windows/portaudio_static_x64";
uuid :: #system_library,no_dll "Uuid";
rpcrt4 :: #system_library,no_dll "Rpcrt4";
dsound :: #system_library,no_dll "dsound";
winmm :: #system_library,no_dll "winmm";
ole32 :: #system_library,no_dll "Ole32";
setupapi :: #system_library,no_dll "Setupapi";

#run {
    {
        instance: PaVersionInfo;
        assert(((cast(*void)(*instance.versionMajor)) - cast(*void)(*instance)) == 0, "PaVersionInfo.versionMajor has unexpected offset % instead of 0", ((cast(*void)(*instance.versionMajor)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaVersionInfo.versionMajor)) == 4, "PaVersionInfo.versionMajor has unexpected size % instead of 4", size_of(type_of(PaVersionInfo.versionMajor)));
        assert(((cast(*void)(*instance.versionMinor)) - cast(*void)(*instance)) == 4, "PaVersionInfo.versionMinor has unexpected offset % instead of 4", ((cast(*void)(*instance.versionMinor)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaVersionInfo.versionMinor)) == 4, "PaVersionInfo.versionMinor has unexpected size % instead of 4", size_of(type_of(PaVersionInfo.versionMinor)));
        assert(((cast(*void)(*instance.versionSubMinor)) - cast(*void)(*instance)) == 8, "PaVersionInfo.versionSubMinor has unexpected offset % instead of 8", ((cast(*void)(*instance.versionSubMinor)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaVersionInfo.versionSubMinor)) == 4, "PaVersionInfo.versionSubMinor has unexpected size % instead of 4", size_of(type_of(PaVersionInfo.versionSubMinor)));
        assert(((cast(*void)(*instance.versionControlRevision)) - cast(*void)(*instance)) == 16, "PaVersionInfo.versionControlRevision has unexpected offset % instead of 16", ((cast(*void)(*instance.versionControlRevision)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaVersionInfo.versionControlRevision)) == 8, "PaVersionInfo.versionControlRevision has unexpected size % instead of 8", size_of(type_of(PaVersionInfo.versionControlRevision)));
        assert(((cast(*void)(*instance.versionText)) - cast(*void)(*instance)) == 24, "PaVersionInfo.versionText has unexpected offset % instead of 24", ((cast(*void)(*instance.versionText)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaVersionInfo.versionText)) == 8, "PaVersionInfo.versionText has unexpected size % instead of 8", size_of(type_of(PaVersionInfo.versionText)));
        assert(size_of(PaVersionInfo) == 32, "PaVersionInfo has size % instead of 32", size_of(PaVersionInfo));
    }

    {
        instance: PaHostApiInfo;
        assert(((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)) == 0, "PaHostApiInfo.structVersion has unexpected offset % instead of 0", ((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.structVersion)) == 4, "PaHostApiInfo.structVersion has unexpected size % instead of 4", size_of(type_of(PaHostApiInfo.structVersion)));
        assert(((cast(*void)(*instance.type)) - cast(*void)(*instance)) == 4, "PaHostApiInfo.type has unexpected offset % instead of 4", ((cast(*void)(*instance.type)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.type)) == 4, "PaHostApiInfo.type has unexpected size % instead of 4", size_of(type_of(PaHostApiInfo.type)));
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 8, "PaHostApiInfo.name has unexpected offset % instead of 8", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.name)) == 8, "PaHostApiInfo.name has unexpected size % instead of 8", size_of(type_of(PaHostApiInfo.name)));
        assert(((cast(*void)(*instance.deviceCount)) - cast(*void)(*instance)) == 16, "PaHostApiInfo.deviceCount has unexpected offset % instead of 16", ((cast(*void)(*instance.deviceCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.deviceCount)) == 4, "PaHostApiInfo.deviceCount has unexpected size % instead of 4", size_of(type_of(PaHostApiInfo.deviceCount)));
        assert(((cast(*void)(*instance.defaultInputDevice)) - cast(*void)(*instance)) == 20, "PaHostApiInfo.defaultInputDevice has unexpected offset % instead of 20", ((cast(*void)(*instance.defaultInputDevice)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.defaultInputDevice)) == 4, "PaHostApiInfo.defaultInputDevice has unexpected size % instead of 4", size_of(type_of(PaHostApiInfo.defaultInputDevice)));
        assert(((cast(*void)(*instance.defaultOutputDevice)) - cast(*void)(*instance)) == 24, "PaHostApiInfo.defaultOutputDevice has unexpected offset % instead of 24", ((cast(*void)(*instance.defaultOutputDevice)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostApiInfo.defaultOutputDevice)) == 4, "PaHostApiInfo.defaultOutputDevice has unexpected size % instead of 4", size_of(type_of(PaHostApiInfo.defaultOutputDevice)));
        assert(size_of(PaHostApiInfo) == 32, "PaHostApiInfo has size % instead of 32", size_of(PaHostApiInfo));
    }

    {
        instance: PaHostErrorInfo;
        assert(((cast(*void)(*instance.hostApiType)) - cast(*void)(*instance)) == 0, "PaHostErrorInfo.hostApiType has unexpected offset % instead of 0", ((cast(*void)(*instance.hostApiType)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostErrorInfo.hostApiType)) == 4, "PaHostErrorInfo.hostApiType has unexpected size % instead of 4", size_of(type_of(PaHostErrorInfo.hostApiType)));
        assert(((cast(*void)(*instance.errorCode)) - cast(*void)(*instance)) == 4, "PaHostErrorInfo.errorCode has unexpected offset % instead of 4", ((cast(*void)(*instance.errorCode)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostErrorInfo.errorCode)) == 4, "PaHostErrorInfo.errorCode has unexpected size % instead of 4", size_of(type_of(PaHostErrorInfo.errorCode)));
        assert(((cast(*void)(*instance.errorText)) - cast(*void)(*instance)) == 8, "PaHostErrorInfo.errorText has unexpected offset % instead of 8", ((cast(*void)(*instance.errorText)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaHostErrorInfo.errorText)) == 8, "PaHostErrorInfo.errorText has unexpected size % instead of 8", size_of(type_of(PaHostErrorInfo.errorText)));
        assert(size_of(PaHostErrorInfo) == 16, "PaHostErrorInfo has size % instead of 16", size_of(PaHostErrorInfo));
    }

    {
        instance: PaDeviceInfo;
        assert(((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)) == 0, "PaDeviceInfo.structVersion has unexpected offset % instead of 0", ((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.structVersion)) == 4, "PaDeviceInfo.structVersion has unexpected size % instead of 4", size_of(type_of(PaDeviceInfo.structVersion)));
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 8, "PaDeviceInfo.name has unexpected offset % instead of 8", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.name)) == 8, "PaDeviceInfo.name has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.name)));
        assert(((cast(*void)(*instance.hostApi)) - cast(*void)(*instance)) == 16, "PaDeviceInfo.hostApi has unexpected offset % instead of 16", ((cast(*void)(*instance.hostApi)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.hostApi)) == 4, "PaDeviceInfo.hostApi has unexpected size % instead of 4", size_of(type_of(PaDeviceInfo.hostApi)));
        assert(((cast(*void)(*instance.maxInputChannels)) - cast(*void)(*instance)) == 20, "PaDeviceInfo.maxInputChannels has unexpected offset % instead of 20", ((cast(*void)(*instance.maxInputChannels)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.maxInputChannels)) == 4, "PaDeviceInfo.maxInputChannels has unexpected size % instead of 4", size_of(type_of(PaDeviceInfo.maxInputChannels)));
        assert(((cast(*void)(*instance.maxOutputChannels)) - cast(*void)(*instance)) == 24, "PaDeviceInfo.maxOutputChannels has unexpected offset % instead of 24", ((cast(*void)(*instance.maxOutputChannels)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.maxOutputChannels)) == 4, "PaDeviceInfo.maxOutputChannels has unexpected size % instead of 4", size_of(type_of(PaDeviceInfo.maxOutputChannels)));
        assert(((cast(*void)(*instance.defaultLowInputLatency)) - cast(*void)(*instance)) == 32, "PaDeviceInfo.defaultLowInputLatency has unexpected offset % instead of 32", ((cast(*void)(*instance.defaultLowInputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.defaultLowInputLatency)) == 8, "PaDeviceInfo.defaultLowInputLatency has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.defaultLowInputLatency)));
        assert(((cast(*void)(*instance.defaultLowOutputLatency)) - cast(*void)(*instance)) == 40, "PaDeviceInfo.defaultLowOutputLatency has unexpected offset % instead of 40", ((cast(*void)(*instance.defaultLowOutputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.defaultLowOutputLatency)) == 8, "PaDeviceInfo.defaultLowOutputLatency has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.defaultLowOutputLatency)));
        assert(((cast(*void)(*instance.defaultHighInputLatency)) - cast(*void)(*instance)) == 48, "PaDeviceInfo.defaultHighInputLatency has unexpected offset % instead of 48", ((cast(*void)(*instance.defaultHighInputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.defaultHighInputLatency)) == 8, "PaDeviceInfo.defaultHighInputLatency has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.defaultHighInputLatency)));
        assert(((cast(*void)(*instance.defaultHighOutputLatency)) - cast(*void)(*instance)) == 56, "PaDeviceInfo.defaultHighOutputLatency has unexpected offset % instead of 56", ((cast(*void)(*instance.defaultHighOutputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.defaultHighOutputLatency)) == 8, "PaDeviceInfo.defaultHighOutputLatency has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.defaultHighOutputLatency)));
        assert(((cast(*void)(*instance.defaultSampleRate)) - cast(*void)(*instance)) == 64, "PaDeviceInfo.defaultSampleRate has unexpected offset % instead of 64", ((cast(*void)(*instance.defaultSampleRate)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaDeviceInfo.defaultSampleRate)) == 8, "PaDeviceInfo.defaultSampleRate has unexpected size % instead of 8", size_of(type_of(PaDeviceInfo.defaultSampleRate)));
        assert(size_of(PaDeviceInfo) == 72, "PaDeviceInfo has size % instead of 72", size_of(PaDeviceInfo));
    }

    {
        instance: PaStreamParameters;
        assert(((cast(*void)(*instance.device)) - cast(*void)(*instance)) == 0, "PaStreamParameters.device has unexpected offset % instead of 0", ((cast(*void)(*instance.device)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamParameters.device)) == 4, "PaStreamParameters.device has unexpected size % instead of 4", size_of(type_of(PaStreamParameters.device)));
        assert(((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)) == 4, "PaStreamParameters.channelCount has unexpected offset % instead of 4", ((cast(*void)(*instance.channelCount)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamParameters.channelCount)) == 4, "PaStreamParameters.channelCount has unexpected size % instead of 4", size_of(type_of(PaStreamParameters.channelCount)));
        assert(((cast(*void)(*instance.sampleFormat)) - cast(*void)(*instance)) == 8, "PaStreamParameters.sampleFormat has unexpected offset % instead of 8", ((cast(*void)(*instance.sampleFormat)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamParameters.sampleFormat)) == 4, "PaStreamParameters.sampleFormat has unexpected size % instead of 4", size_of(type_of(PaStreamParameters.sampleFormat)));
        assert(((cast(*void)(*instance.suggestedLatency)) - cast(*void)(*instance)) == 16, "PaStreamParameters.suggestedLatency has unexpected offset % instead of 16", ((cast(*void)(*instance.suggestedLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamParameters.suggestedLatency)) == 8, "PaStreamParameters.suggestedLatency has unexpected size % instead of 8", size_of(type_of(PaStreamParameters.suggestedLatency)));
        assert(((cast(*void)(*instance.hostApiSpecificStreamInfo)) - cast(*void)(*instance)) == 24, "PaStreamParameters.hostApiSpecificStreamInfo has unexpected offset % instead of 24", ((cast(*void)(*instance.hostApiSpecificStreamInfo)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamParameters.hostApiSpecificStreamInfo)) == 8, "PaStreamParameters.hostApiSpecificStreamInfo has unexpected size % instead of 8", size_of(type_of(PaStreamParameters.hostApiSpecificStreamInfo)));
        assert(size_of(PaStreamParameters) == 32, "PaStreamParameters has size % instead of 32", size_of(PaStreamParameters));
    }

    {
        instance: PaStreamCallbackTimeInfo;
        assert(((cast(*void)(*instance.inputBufferAdcTime)) - cast(*void)(*instance)) == 0, "PaStreamCallbackTimeInfo.inputBufferAdcTime has unexpected offset % instead of 0", ((cast(*void)(*instance.inputBufferAdcTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamCallbackTimeInfo.inputBufferAdcTime)) == 8, "PaStreamCallbackTimeInfo.inputBufferAdcTime has unexpected size % instead of 8", size_of(type_of(PaStreamCallbackTimeInfo.inputBufferAdcTime)));
        assert(((cast(*void)(*instance.currentTime)) - cast(*void)(*instance)) == 8, "PaStreamCallbackTimeInfo.currentTime has unexpected offset % instead of 8", ((cast(*void)(*instance.currentTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamCallbackTimeInfo.currentTime)) == 8, "PaStreamCallbackTimeInfo.currentTime has unexpected size % instead of 8", size_of(type_of(PaStreamCallbackTimeInfo.currentTime)));
        assert(((cast(*void)(*instance.outputBufferDacTime)) - cast(*void)(*instance)) == 16, "PaStreamCallbackTimeInfo.outputBufferDacTime has unexpected offset % instead of 16", ((cast(*void)(*instance.outputBufferDacTime)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamCallbackTimeInfo.outputBufferDacTime)) == 8, "PaStreamCallbackTimeInfo.outputBufferDacTime has unexpected size % instead of 8", size_of(type_of(PaStreamCallbackTimeInfo.outputBufferDacTime)));
        assert(size_of(PaStreamCallbackTimeInfo) == 24, "PaStreamCallbackTimeInfo has size % instead of 24", size_of(PaStreamCallbackTimeInfo));
    }

    {
        instance: PaStreamInfo;
        assert(((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)) == 0, "PaStreamInfo.structVersion has unexpected offset % instead of 0", ((cast(*void)(*instance.structVersion)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamInfo.structVersion)) == 4, "PaStreamInfo.structVersion has unexpected size % instead of 4", size_of(type_of(PaStreamInfo.structVersion)));
        assert(((cast(*void)(*instance.inputLatency)) - cast(*void)(*instance)) == 8, "PaStreamInfo.inputLatency has unexpected offset % instead of 8", ((cast(*void)(*instance.inputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamInfo.inputLatency)) == 8, "PaStreamInfo.inputLatency has unexpected size % instead of 8", size_of(type_of(PaStreamInfo.inputLatency)));
        assert(((cast(*void)(*instance.outputLatency)) - cast(*void)(*instance)) == 16, "PaStreamInfo.outputLatency has unexpected offset % instead of 16", ((cast(*void)(*instance.outputLatency)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamInfo.outputLatency)) == 8, "PaStreamInfo.outputLatency has unexpected size % instead of 8", size_of(type_of(PaStreamInfo.outputLatency)));
        assert(((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)) == 24, "PaStreamInfo.sampleRate has unexpected offset % instead of 24", ((cast(*void)(*instance.sampleRate)) - cast(*void)(*instance)));
        assert(size_of(type_of(PaStreamInfo.sampleRate)) == 8, "PaStreamInfo.sampleRate has unexpected size % instead of 8", size_of(type_of(PaStreamInfo.sampleRate)));
        assert(size_of(PaStreamInfo) == 32, "PaStreamInfo has size % instead of 32", size_of(PaStreamInfo));
    }
}

