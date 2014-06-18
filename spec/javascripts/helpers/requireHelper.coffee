requireDependencies = (deps, cb) ->
  deps = (if Array.isArray(deps) then deps else [deps])
  beforeEach ->
    done = false
    runs ->
      require deps, ->
        cb and cb.apply(cb, arguments_)
        done = true
        return

      return

    waitsFor ->
      done

    return

  return

# Allows me to specify stubs to return from a require
requireStubs = (stubs) ->
  spyOn(window, "require").andCallFake (deps, cb) ->
    if Array.isArray(deps) and deps.some((dep) ->
      stubs[dep.replace(/.*\//, "")]
    )
      retDeps = deps.map((dep) ->
        stubs[dep.replace(/.*\//, "")]
      )
      cb and cb.apply(cb, retDeps)
    else
      window.require.originalValue.apply window.require, arguments_
    return

  return
