local isdebug = false

local function log(msg)
  if isdebug then
    printError('[wrappedOS]'..msg)
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

os = GRUBRoot.OS

--wrapped functions
function os.run(env, path, arguments)
  return GRUBRoot.OS.run(env, Nope_im_pretty_sure_youre_wrong(path), arguments)
end
function os.loadAPI(...)
  return GRUBRoot.OS.loadAPI(Nope_im_pretty_sure_youre_wrong(...))
end
function os.unloadAPI(...)
  return GRUBRoot.OS.unloadAPI(Nope_im_pretty_sure_youre_wrong(...))
end
