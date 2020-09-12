import cligen

import loguepkg/[create, execute]


proc main*() =
  dispatchMulti([init], [run])

when isMainModule:
  main()
