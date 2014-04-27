local isdebug = false

local function log(msg)
  if isdebug then
    printError('[wrappedFS]'..msg)
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

fs = GRUBRoot.FS

--wrapped functions
function fs.list(...)
  return GRUBRoot.FS.list(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.exists(...)
  return GRUBRoot.FS.exists(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.isDir(...)
  return GRUBRoot.FS.isDir(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.isReadOnly(...)
  return GRUBRoot.FS.isReadOnly(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.getName(...)
  return GRUBRoot.FS.getName(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.getDrive(...)
  return GRUBRoot.FS.getDrive(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.getSize(...)
  return GRUBRoot.FS.getSize(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.getFreeSpace(...)
  return GRUBRoot.FS.getFreeSpace(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.makeDir(...)
  return GRUBRoot.FS.makeDir(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.move(...)
  return GRUBRoot.FS.move(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.copy(...)
  return GRUBRoot.FS.copy(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.delete(...)
  return GRUBRoot.FS.delete(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.combine(...)
  return GRUBRoot.FS.combine(Nope_im_pretty_sure_youre_wrong(...))
end
function fs.open(path, mode)
  return GRUBRoot.FS.open(Nope_im_pretty_sure_youre_wrong(path), mode)
end
