local tArgs = {...}
local isDebug = (tArgs[1] == 'true')

function output(n,n2,r,f,auto,u)
  term.setCursorPos(1,1)
  term.clear()
  print(n..'/'..n2)
  print(r..f..' ==> '..f)
  print(auto)
  print(u)
end
local t = shell.getRunningProgram()
if t ~= 'launcher' then
  fs.move(t,'launcher')
  printError('Invalid file name. Correcting and rebooting.')
  sleep(2)
  os.reboot()
end

output('?','?','unknown','','unknown','unknown')

-- Thanks to SuicidalSTDz for writing this launcher framework

--# USER VARIABLE(S)
local shouldAutoUpdate = true

--# Files to grab when updating/installing
local tFiles = {
    'startup',
    'README.md',
    'os/CraftOS/name.grub',
    'os/CraftOS/startup',
    'lgrub.sys/splash.lua',
    'lgrub.sys/api/lgrub.lua',
    'lgrub.sys/api/Drawing.lua', -- Thanks oeed!
    'lgrub.sys/api/wrappedFS.lua',
  }
local repo = 'https://raw.github.com/skwerlman/LGRUB-stable/master/'
if isDebug then -- use debug repo instead
  repo = 'https://raw.github.com/skwerlman/LuaGRUB/master/'
end

local root = shell.dir() or ''
local updated = false

--# Create directories if they are not present
if not fs.exists( root .. '/os' ) then
	fs.makeDir( root .. '/os' )
end
if not fs.exists( root .. '/lgrub.sys' ) then
	fs.makeDir( root .. '/lgrub.sys' )
end
if not fs.exists( root .. '/lgrub.sys/api' ) then
	fs.makeDir( root .. '/lgrub.sys/api' )
end
if not fs.exists( root .. '/os/CraftOS' ) then
	fs.makeDir( root .. '/os/CraftOS' )
end

local function downloadFile( url, sFile )
  local response = http.get( url )
  if response then
    local sResponse = response.readAll()
    response.close()
    
    local handle = fs.open( root .. sFile, 'w' )
    handle.write( sResponse )
    handle.close()
    return true
  else
    return false
  end
end

--# Main Update Script
output(0,#tFiles+1,repo,'unknown',shouldAutoUpdate,updated)
for i = 1, #tFiles do
  local sFile = tFiles[i]
  --# Grab the file and store it's contents in a string to check against later
  local sResponse
  local response = http.get( repo .. sFile )
  if response then
    sResponse = response.readAll()
    response.close()
  end
  
  --# Open the currently installed file to check against the downloaded file
  if not fs.exists( sFile ) then
    local handle = fs.open( sFile, 'w' )
    handle.write( 'test' )
    handle.close()
  end
  local handle = fs.open( sFile, 'r' )
  local sData = handle.readAll()
  handle.close()
     
  --# If the file does not exist or doesn't match the downloaded file, then update said file
  if sResponse ~= '' then
    if ( sData ~= sResponse and shouldAutoUpdate ) then
      local handle = fs.open( sFile, 'w' )
      handle.write( sResponse, 'w' )
      handle.close()
      updated = true
    end
  end
  output(i,#tFiles+1,repo,sFile,shouldAutoUpdate,updated)
end

--# Update the launcher, if need be

output(#tFiles+1,#tFiles+1,repo,'launcher',shouldAutoUpdate,updated)

local sRunning = shell.getRunningProgram()
local response = http.get( repo .. 'launcher' )
if response then
  local sResponse = response.readAll()
  response.close()
  
  local handle = fs.open( sRunning, 'r' )
  local sData = handle.readAll()
  handle.close()
  
  if sResponse ~= '' then
    if ( sData ~= sResponse and shouldAutoUpdate ) then
      fs.delete( sRunning )
      local handle = fs.open( sRunning, 'w' )
      handle.write( sResponse )
      handle.close()
      updated = true
    end
  end
  output(#tFiles+1,#tFiles+1,repo,'launcher',shouldAutoUpdate,updated)
end

if updated then
  os.reboot()
end
