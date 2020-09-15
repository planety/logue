import cligen

import loguepkg/[create, execute, extend]


proc main*() =
  dispatchMulti([init], [run], [extension])

when isMainModule:
  main()
