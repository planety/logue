import cligen

import loguepkg/create


proc main*() =
  dispatchMulti([init])

when isMainModule:
  main()
