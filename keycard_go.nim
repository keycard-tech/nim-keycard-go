import ./keycard_go/impl as go_shim

export KeycardSignalCallback

proc keycardInitFlow*(storageDir: string): string =
  echo "before calling keycardInitFlow"
  var funcOut = go_shim.keycardInitFlow(storageDir.cstring)
  echo "after calling keycardInitFlow"
  defer: go_shim.free(funcOut)
  echo "after feeeing memory in keycardInitFlow"
  var response = "nil"
  if not funcOut.isNil:
    echo "funcOut is not Nil in keycardInitFlow"
    response = $funcOut
  echo "returning response for keycardInitFlow ->", $response
  return response

proc keycardStartFlow*(flowType: int, jsonParams: string): string =
  var funcOut = go_shim.keycardStartFlow(flowType.cint, jsonParams.cstring)
  defer: go_shim.free(funcOut)
  return $funcOut

proc keycardResumeFlow*(jsonParams: string): string =
  var funcOut = go_shim.keycardResumeFlow(jsonParams.cstring)
  defer: go_shim.free(funcOut)
  return $funcOut

proc keycardCancelFlow*(): string =
  echo "before calling keycardCancelFlow"
  var funcOut = go_shim.keycardCancelFlow()
  echo "after calling keycardCancelFlow"
  defer: go_shim.free(funcOut)
  echo "after feeeing memory in keycardCancelFlow"
  var response = "nil"
  if not funcOut.isNil:
      echo "funcOut is not Nil in keycardCancelFlow"
      response = $funcOut
  echo "returning response for keycardCancelFlow ->", $response
  return response

proc setSignalEventCallback*(callback: KeycardSignalCallback) =
  go_shim.setSignalEventCallback(callback)

# availale in test mode only
proc mockedLibRegisterKeycard*(cardIndex: int, readerState: int, keycardState: int, mockedKeycard: string, mockedKeycardHelper: string): string =
  var funcOut = go_shim.mockedLibRegisterKeycard(cardIndex.cint, readerState.cint, keycardState.cint, mockedKeycard.cstring, mockedKeycardHelper.cstring)
  defer: go_shim.free(funcOut)
  return $funcOut

proc mockedLibReaderPluggedIn*(): string =
  var funcOut = go_shim.mockedLibReaderPluggedIn()
  defer: go_shim.free(funcOut)
  return $funcOut

proc mockedLibReaderUnplugged*(): string =
  var funcOut = go_shim.mockedLibReaderUnplugged()
  defer: go_shim.free(funcOut)
  return $funcOut

proc mockedLibKeycardInserted*(cardIndex: int): string =
  var funcOut = go_shim.mockedLibKeycardInserted(cardIndex.cint)
  defer: go_shim.free(funcOut)
  return $funcOut

proc mockedLibKeycardRemoved*(): string =
  var funcOut = go_shim.mockedLibKeycardRemoved()
  defer: go_shim.free(funcOut)
  return $funcOut
