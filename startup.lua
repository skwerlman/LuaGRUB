local __tempPEStorage = os.pullEvent
os.pullEvent = os.pullEventRaw -- Prevent ctrl-T
local h, w = term.getSize()
os.loadAPI(shell.dir()..'lgrub.sys/api/lgrub.lua') -- an interface that allows OSes to list other OSes by name, and also what we use here.
os.loadAPI(shell.dir()..'lgrub.sys/api/Drawing.lua') -- Oeed's drawing API
--os.loadAPI(shell.dir()..'lgrub.sys/api/wrappedFS.lua') -- forces relative paths (hopefully)
--fs = wrappedFS -- Replace the standard fs with wrappedFS
-- ^^ Not yet functional, but planned

local function grub_countdown()
  for i=1, 10 do
    sleep(1)
  end
end

local function grub_selector()
  
end

parallel.waitForAny(grub_countdown, grub_selector) -- Wait up to ten seconds for user input, or use the first OS found, alphabetically

local __osName = lgrub.newOS
local __continue = true
while __continue do
  __continue = false -- default is to shutdown after os ends, if they haven't already
  if __osName == 'CraftOS' then -- enable CraftOS support; not a boot option, must be enabled by OS
    term.clear()
    return -- end now, but without shutdown
  end
  if __osName == 'Shutdown' then -- force immediate power down
    os.shutdown()
  end
  os.pullEvent = __tempPEStorage -- Restore os.pullEvent to prevent possible conflicts
  lgrub.run(__osName)
  os.pullEvent = os.pullEventRaw -- Prevent ctrl-t again
  if lgrub.goAgain then
    __osName = lgrub.newOS
    __continue = true
  end
end
os.shutdown() -- This is always skipped for CraftOS, and usually won't be run ever, unless the OS forgets to power down. This helps prevent hacking/mistakes.
