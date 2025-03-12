# go functions do not raise nim exceptions and do not interact with the Nim gc
{.push raises: [], gcsafe.}

# NOTE: Methods here begin with "Keycard" to avoid name conflicts with status-go

type KeycardSignalCallback* = proc(signal: cstring): void {.cdecl, gcsafe, raises: [].}

proc initializeStatusKeycardGo*(): void {.importc: "InitializeStatusKeycardGo".}

proc free*(param: pointer) {.importc: "Free".}
proc setSignalEventCallback*(callback: KeycardSignalCallback) {.importc: "KeycardSetSignalEventCallback".}
proc resetAPI*() {.importc: "ResetAPI".}

proc keycardInitFlow*(storageDir: cstring): cstring {.importc: "KeycardInitFlow".}
proc keycardStartFlow*(flowType: cint, jsonParams: cstring): cstring {.importc: "KeycardStartFlow".}
proc keycardResumeFlow*(jsonParams: cstring): cstring {.importc: "KeycardResumeFlow".}
proc keycardCancelFlow*(): cstring {.importc: "KeycardCancelFlow".}
proc keycardInitializeRPC*(): cstring {.importc: "KeycardInitializeRPC".}
proc keycardCallRPC*(params: cstring): cstring {.importc: "KeycardCallRPC".}

# availale in test mode only
proc mockedLibRegisterKeycard*(cardIndex: cint, readerState: cint, keycardState: cint, mockedKeycard: cstring, mockedKeycardHelper: cstring): cstring {.importc: "MockedLibRegisterKeycard".}
proc mockedLibReaderPluggedIn*(): cstring {.importc: "MockedLibReaderPluggedIn".}
proc mockedLibReaderUnplugged*(): cstring {.importc: "MockedLibReaderUnplugged".}
proc mockedLibKeycardInserted*(cardIndex: cint): cstring {.importc: "MockedLibKeycardInserted".}
proc mockedLibKeycardRemoved*(): cstring {.importc: "MockedLibKeycardRemoved".}
