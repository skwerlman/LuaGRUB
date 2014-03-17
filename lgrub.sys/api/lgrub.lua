version='1.0-exp'
enabled=true
local shell
local grubDir
local cont=false
local tempOS
function listOSes()
  local dirs=fs.list(osDir)
  local tOut={}
  local sData
  for i,dir in ipairs(dirs) do
    dir=osDir..'/'..dir
    local items=fs.list(dir)
    if fs.isDir(dir) then
      if fs.exists(dir..'/name.grub') then
        local file=fs.open(dir..'/name.grub','r')
        sData=file.readLine()
        file.close()
        tOut[#tOut+1]={sData,dir}
      else
        tOut[#tOut+1]={dir,dir}
      end
    end
  end
  table.insert(tOut,{'Shutdown','Shutdown'})
  return tOut
end
function bootNewOS(osName)
  newOS=osName
  cont=true
end
function rebootOS()
  cont=true
end
function run(osName)
  term.setCursorPos(1,1)
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.black)
  term.clear()
  shell.run(osName)
  term.clear()
end
local function setShell(t)
  shell=t
  grubDir=shell.dir()
  osDir=grubDir..'/os'
end
function init(shellRef)
  setShell(shellRef or shell)
  if not shell then
    error('Must pass a shell reference at least once')
  end
end
-- Ignore everything below here; they are only for the bootloader to access private variables
-- Using these can break stuff
function prepForRun(path)
tempOS=path
end
function getPrepped()
return tempOS
end
function done()
cont=false
end
function goAgain()
return cont
end