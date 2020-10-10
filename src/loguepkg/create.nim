import std / [os, strformat, json]
import tml / [app, urls, views, appconf]


let
  defaultConfig = %* {"prologue": {
    "address": "",
    "port": 8080,
    "debug": true,
    "reusePort": true,
    "appName": "",
    "secretKey": "Set by yourself",
    "bufSize": 40960
    }
  }

  defaultDebugConfig = %* {"prologue": {
    "address": "",
    "port": 8080,
    "debug": true,
    "reusePort": true,
    "appName": "",
    "secretKey": "Set by yourself",
    "bufSize": 40960
    }
  }

  defaultProductionConfig = %* {"prologue": {
    "address": "",
    "port": 8080,
    "debug": false,
    "reusePort": true,
    "appName": "",
    "secretKey": "Set by yourself",
    "bufSize": 40960
    }
  }


func getEnvContent(appName: string): string =
  result = fmt"""# Don't commit this to source control.
# Eg. Make sure ".env" in your ".gitignore" file.
# If you want to release you programs, make sure set debug=false.
debug=true
port=8080
appName={appName}
secretKey=Pr435ol67ogue
"""


proc initProject(projName: string, useConfig: bool) =
  createDir(projName)
  writeFile(projName / "urls.nim", urlsStr)
  writeFile(projName / "views.nim", viewsStr)

  if not useConfig:
    writeFile(projName / "app.nim", appStr)
    writeFile(projName / ".env", getEnvContent(projName))
  else:
    writeFile(projName / "app.nim", appConfStr)
    createDir(projName / ".config")
    writeFile(projName / ".config" / "config.json", pretty defaultConfig)
    writeFile(projName / ".config" / "config.debug.json", pretty defaultDebugConfig)
    writeFile(projName / ".config" / "config.production.json", pretty defaultProductionConfig)


proc init*(name: seq[string], useConfig = false) =
  if name.len == 0:
    echo "Please give the name of your project!"
  else:
    let projName = name[0]
    if dirExists(projName):
      echo fmt"{projName} already exists!"
    else:
      initProject(projName, useConfig)
