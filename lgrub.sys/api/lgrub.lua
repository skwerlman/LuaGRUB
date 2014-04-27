
lgrub = {
  ["version"] = '1.0.1',
  ["enabled"] = true, -- For OSes to see if we're working; will be true if lgrub is present, otherwise nil; check as 'if lgrub and lgrub.enabled then'
  ["thisOS"] = '',
  ["grubDir"] = '',
  ["tempOS"] = '',
  ["newOS"] = '',
  ["cont"] = false,
  ["osDir"] = ''
}

function lgrub.bootNewOS(osName)
  lgrub.newOS = osName
  lgrub.cont = true
end

function lgrub.rebootOS()
  lgrub.cont = true
end

function lgrub.listOSes() -- This is a public function because OSes might allow the installation of new OSes. After a new one is installed, they should run this.
  local dirs = GRUBRoot.FS.list(lgrub.osDir)
  local tOut = {}
  local sData
  for i, dir in ipairs(dirs) do
    dir = osDir..'/'..dir
    local items = GRUBRoot.FS.list(dir)
    if GRUBRoot.FS.isDir(dir) then
      if GRUBRoot.FS.exists(dir..'/name.grub') then -- they have declared their name
        local file = GRUBRoot.FS.open(dir..'/name.grub', 'r')
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

-- ignore everything below here; using them could break things

function lgrub.setRunning(osName)
  lgrub.thisOS = osName:sub(1,-8)
end

function prepForRun(path)
  tempOS = path
end

function getPrepped()
  return tempOS
end

function goAgain()
  return cont
end

function getNewOS()
  return newOS
end
