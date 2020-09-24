import os, strformat


proc exe(appName: string) =
  when defined(windows):
    discard execShellCmd(fmt"nim c -r --hints:off --d:release --threads:on {appName}")
  else:
    discard execShellCmd(fmt"nim c -r --hints:off --d:release --threads:on {appName}")

proc run*(name: seq[string]) =
  if name.len == 0 and fileExists("app.nim"):
    exe("app.nim")
  elif name.len > 0:
    exe(name[0])
  else:
    echo "Please give the name of your main program or create app.nim!"
