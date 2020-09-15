import os, strformat, osproc, strutils

const
  nimbleFile = "prologue.nimble"


template withDir(dir: string; body: untyped): untyped =
  var curDir = getCurrentDir()
  try:
    setCurrentDir(dir)
    body
  finally:
    setCurrentDir(curDir)

proc extension*(name: seq[string]) =
  if name.len == 0:
    echo "Please give the name of the extension or use logue extension all to install all extensions"
  else:
    # TODO May raise OsError in windows
    var output: string
    var errC: int
    if fileExists(nimbleFile):
      (output, errC) = (nimbleFile, 0)
    else:
      (output, errC) = execCmdEx("nimble path prologue")
    if errC == 0:
      stripLineEnd(output)
      normalizePath(output)

      withDir output:
        var errC: int

        let extension = name[0]

        if extension == "all":
          discard execCmd(fmt"nimble extension")
        else:
          try:
            errC = execCmd(fmt"nimble {extension}")
          except OSError:
            errC = 1

        if errC != 0:
          echo "Please give the right name of the extension"
    else:
      echo "Please install prologue or check whther nimble is added to path"
