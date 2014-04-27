local isdebug = false

local function log(msg)
  if isdebug then
    printError('[wrappedSH]'..msg)
    sleep(.3)
  end
end

local function Nope_im_pretty_sure_youre_wrong(...) -- convince the OS we know better
  local tArg = {...}
  local tOut = {}
  for k,v in ipairs(tArg) do
    if type(v) == "string" then
      if v=="." then 
        tOut[k] = lgrub.thisOS
      else
        --v=v:gmatch(".","")
        log('v:'..(v or 'nil'))
        log('thisOS:'..(lgrub.thisOS or 'nil'))
        if not lgrub.thisOS then printError('WARNING: lgrub not initialized; sandbox may be broken') sleep(2) end
        local root = lgrub.thisOS or '/' -- If lgrub's not intialized, we don't want to error, so we assume root priviliges
        log('root:'..(root or 'nil'))
        tOut[k] = root..v
      end
    else
      error('Expected string, got '..type(v))
    end
  end
  return unpack(tOut)
end

local function Dont_worry_im_sure_the_shell_made_a_mistake_anyway(...) -- don't let the OS know where it really is
  local tArg = {...}
  local tOut = {}
  for k,v in ipairs(tArg) do
    if type(v) == "string" then
      tOut[k] = v:sub(math.min(#lgrub.thisOS, v:len()))
  end
  return unpack(tOut)
end

shell = GRUBRoot.SHELL

--wrapped functions
function shell.dir()
  return Dont_worry_im_sure_the_shell_made_a_mistake_anyway(GRUBRoot.SHELL.dir())
end
function shell.setDir(...)
  return GRUBRoot.SHELL.setDir(Nope_im_pretty_sure_youre_wrong(...))
end
function shell.path()
  return Dont_worry_im_sure_the_shell_made_a_mistake_anyway(GRUBRoot.SHELL.path())
end
function shell.setPath(...)
  return GRUBRoot.SHELL.setPath(Nope_im_pretty_sure_youre_wrong(...))
end
function shell.resolve(...)
  return Dont_worry_im_sure_the_shell_made_a_mistake_anyway(GRUBRoot.SHELL.resolve(...))
end
function shell.resolveProgram(...)
  return Dont_worry_im_sure_the_shell_made_a_mistake_anyway(GRUBRoot.SHELL.resolveProgram(...))
end
function shell.setAlias(alias, program)
  return GRUBRoot.SHELL.setAlias(alias, Nope_im_pretty_sure_youre_wrong(program))
end
function shell.getRunningProgram()
  return Dont_worry_im_sure_the_shell_made_a_mistake_anyway(GRUBRoot.SHELL.getRunningProgram())
end
function shell.run(command, ...)
  return GRUBRoot.SHELL.run(Nope_im_pretty_sure_youre_wrong(command), ...)
end
if GRUBRoot.SHELL.openTab then -- were in CC 1.6, so we wrap openTab
  function shell.openTab(command, ...)
    return GRUBRoot.SHELL.openTab(Nope_im_pretty_sure_youre_wrong(command), ...)
  end
end
