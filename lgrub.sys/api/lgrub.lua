
local grubDir = shell.dir()
osDir = grubDir..'os/'
goAgain = false
newOS = nil
OSes = nil
version = t

enabled = true -- For OSes; will be true if lgrub is present, otherwise nil

function bootNewOS(osName)
  newOS = osName
  goAgain = true
end

function listOSes()
  local dirs = fs.list(osDir)
  local tOut
  for i, dir in ipairs(dirs) do
    local items = fs.list(dir)
    if fs.isDir(dir) then
      if fs.exits(dir..'name.grub') then -- they have declared their name
        local file = fs.open(dir..'name.grub', 'a')
        data = file.readLine() -- We get their actual name
        fs.close(file)
        tOut[#t+1] = { sData, dir }
      else -- They didn't declare their name, so we assume it's the same as the directory they're in
        tOut[#t+1] = { dir, dir }
      end
    end
  end
  return tOut
end

function run(osName)
  term.clear() -- We clear the screen in case the OS doesn't
  shell.run(osDir..osName)
  term.clear() -- We clear the screen again, if we aren't already powered off
end

OSes = listOSes()