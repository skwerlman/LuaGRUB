local shell

local grubDir
osDir = nil
goAgain = false
newOS = nil
OSes = { { nil, nil } } -- must run listOSes to populate this list
version = t

enabled = true -- For OSes to see if we exist; will be true if lgrub is present, otherwise nil

function bootNewOS(osName) -- Will set the next OS to be run. The OS must return rather than reboot.
  newOS = osName
  goAgain = true
end

function rebootOS() -- Tell the bootloader to boot again, but doesn't change the OS to be run. The OS must return rather than reboot.
  goAgain = true
end

function done()
  goAgain = false
end

function listOSes() -- This is a public function because OSes might allow the installation of new OSes. After a new one is installed, they should run this.
  local dirs = fs.list(osDir)
  local tOut
  for i, dir in ipairs(dirs) do
    local items = fs.list(dir)
    if fs.isDir(dir) then
      if fs.exits(dir..'/name.grub') then -- they have declared their name
        local file = fs.open(dir..'/name.grub', 'a')
        data = file.readLine() -- We get their actual name
        fs.close(file)
        tOut[#t+1] = { sData, dir }
      else -- They didn't declare their name, so we assume it's the same as the directory they're in
        tOut[#t+1] = { dir, dir }
      end
    end
  end
  OSes = tOut
end

function run(osName)
  term.clear() -- We clear the screen in case the OS doesn't
  shell.run(osDir..osName)
  term.clear() -- We clear the screen again, if we aren't already powered off
end

local function setShell( t )
  shell = t
  grubDir = shell.dir()
  osDir = grubDir..'/os'
end

function init(shellRef)
  setShell(shellRef)
  listOSes()
end
