# Package

version       = "0.1.2"
author        = "flywind"
description   = "Command line tools for Prologue."
license       = "Apache-2.0"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["logue"]



# Dependencies

requires "nim >= 1.2.0"
requires "cligen >= 1.1.0"
