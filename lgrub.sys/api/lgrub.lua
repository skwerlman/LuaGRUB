version = '1.0.0'
enabled = true -- For OSes to see if we exist; will be true if lgrub is present, otherwise nil

local shell, grubDir, tempOS, newOS
local cont = false -- been having weird problems with public variables, had to wrap them in functions

function bootNewOS(osName)
  newOS = osName
  cont = true
end

function rebootOS()
  cont = true
end

function listOSes() -- This is a public function because OSes might allow the installation of new OSes. After a new one is installed, they should run this.
  local dirs = fs.list(osDir)
  local tOut = {}
  local sData
  for i, dir in ipairs(dirs) do
    dir = osDir..'/'..dir
    local items = fs.list(dir)
    if fs.isDir(dir) then
      if fs.exists(dir..'/name.grub') then -- they have declared their name
        local file = fs.open(dir..'/name.grub', 'r')
        sData = file.readLine() -- We get their actual name
        file.close()
        tOut[#tOut+1] = { sData, dir }
      else -- They didn't declare their name, so we assume it's the same as the directory they're in
        tOut[#tOut+1] = { dir, dir }
      end
    end
  end
  table.insert(tOut,{'Shutdown', 'Shutdown'})
  return tOut
end

function run(osName)
  term.setCursorPos(1,1)
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.black)
  term.clear()
  shell.run(osName)
  term.clear()
end

local function setShell( t )
  shell = t
  grubDir = shell.dir()
  osDir = grubDir..'/os'
end

function init(shellRef)
  setShell(shellRef or shell)
  if not shell then
    error('Must pass a shell reference at least once')
  end
end

-- ignore everything below here; using them could break things

function prepForRun(path)
  tempOS = path
end

function getPrepped()
  return tempOS
end

function done()
  cont = false
end

function goAgain()
  return cont
end

function getNewOS()
  return newOS
end
