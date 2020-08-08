# logue
Command tools for Prologue in Nim.

# Installation
```
nimble install logue
```

Make sure `~/.nimble/bin` is in your environment variables.

## Usage
Use `logue init yourprojectname` to initialize your project.

For example, type command `logue init helloworld` to initialize. This will create program
structure like this:

```
- helloworld
  .env
  app.nim
  urls.nim
  views.nim
```

You must switch to `/.../helloworld` directory to run `app.nim`.
