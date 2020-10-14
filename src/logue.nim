import cligen

import loguepkg/[create, execute, extend]


proc main*() =
  dispatchMulti([init, help={"name": "The name of project.", "useConfig": "Creates .config directory."}],
                [run, help={"name": "The name of application."}], 
                [extension, help={"name": "The name of extensions."}])

when isMainModule:
  main()
