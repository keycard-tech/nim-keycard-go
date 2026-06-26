import ./keycard_go/impl as go_shim

export KeycardSignalCallback

proc keycardCallRPC*(params: string): string =
  var funcOut = go_shim.keycardCallRPC(params.cstring)
  defer: go_shim.free(funcOut)
  return $funcOut

proc setSignalEventCallback*(callback: KeycardSignalCallback) =
  go_shim.setSignalEventCallback(callback)

# Available only when status-keycard-qt is built with USE_SIMULATED_KEYCARD (app built with -d:useSimulatedKeycard)
when defined(useSimulatedKeycard):
  proc keycardTestCreateCard*(cardId: string): string =
    var funcOut = go_shim.keycardTestCreateCard(cardId.cstring)
    defer: go_shim.free(funcOut)
    return $funcOut

  proc keycardTestInsertCard*(cardId: string): string =
    var funcOut = go_shim.keycardTestInsertCard(cardId.cstring)
    defer: go_shim.free(funcOut)
    return $funcOut

  proc keycardTestRemoveCard*(): string =
    var funcOut = go_shim.keycardTestRemoveCard()
    defer: go_shim.free(funcOut)
    return $funcOut

  proc keycardTestPlugReader*(): string =
    var funcOut = go_shim.keycardTestPlugReader()
    defer: go_shim.free(funcOut)
    return $funcOut

  proc keycardTestUnplugReader*(): string =
    var funcOut = go_shim.keycardTestUnplugReader()
    defer: go_shim.free(funcOut)
    return $funcOut
