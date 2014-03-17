local shell

local grubDir
local cont = false
version = '0.1-exp DEV'

enabled = true -- For OSes to see if we exist; will be true if lgrub is present, otherwise nil

function bootNewOS(osName) -- Will set the next OS to be run. The OS must return rather than reboot.
  newOS = osName
  cont = true
end

function rebootOS() -- Tell the bootloader to boot again, but doesn't change the OS to be run. The OS must return rather than reboot.
  cont = true
end

function done()
  cont = false
end

function goAgain()
  return cont
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
