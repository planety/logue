import os, strformat


proc getEnvContent(appName: string): string =
  result = fmt"""# Don't commit this to source control.
# Eg. Make sure ".env" in your ".gitignore" file.
# If you want to release you programs, make sure debug=false.
debug=true
port=8080
appName={appName}
staticDir=/static
secretKey=Pr435ol67ogue
"""


proc initProject(projName: string) =
  createDir(projName)
  let 
    appFile = projName / "app.nim"
    urlsFile = projName / "urls.nim"
    viewsFile = projName / "views.nim"
    envFile = projName / ".env"

  let path = currentSourcePath().splitPath.head

  copyFile(path / "tml" / "app.nim", appFile)
  copyFile(path / "tml" / "urls.nim", urlsFile)
  copyFile(path / "tml" / "views.nim", viewsFile)
  writeFile(envFile, getEnvContent(projName))



proc init*(name: seq[string]) =
  if name.len == 0:
    echo "Please give the name of your project!"
  else:
    let projName = name[0]
    if dirExists(projName):
      echo fmt"{projName} already exists!"
    else:
      createDir(projName)
      initProject(projName)