# go functions do not raise nim exceptions and do not interact with the Nim gc
{.push raises: [], gcsafe.}

# NOTE: Methods here begin with "Keycard" to avoid name conflicts with status-go

type KeycardSignalCallback* = proc(signal: cstring): void {.cdecl, gcsafe, raises: [].}

proc free*(param: pointer) {.importc: "Free".}
proc setSignalEventCallback*(callback: KeycardSignalCallback) {.importc: "KeycardSetSignalEventCallback".}

proc keycardCallRPC*(params: cstring): cstring {.importc: "KeycardCallRPC".}

# Available only when status-keycard-qt is built with USE_SIMULATED_KEYCARD (app built with -d:useSimulatedKeycard)
when defined(useSimulatedKeycard):
  proc keycardTestCreateCard*(cardId: cstring): cstring {.importc: "KeycardTestCreateCard".}
  proc keycardTestInsertCard*(cardId: cstring): cstring {.importc: "KeycardTestInsertCard".}
  proc keycardTestRemoveCard*(): cstring {.importc: "KeycardTestRemoveCard".}
  proc keycardTestPlugReader*(): cstring {.importc: "KeycardTestPlugReader".}
  proc keycardTestUnplugReader*(): cstring {.importc: "KeycardTestUnplugReader".}
