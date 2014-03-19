-- run 'wrappedFS.init(fs) fs = wrappedFS' after 'os.loadAPI'

local oldFS

function init(fileSystem)
  oldFS = fileSystem
end

--wrapped functions
function list(path)
  return oldFS.list(lgrub.thisOS..path)
end
function exists(path)
  return oldFS.exists(lgrub.thisOS..path)
end
function isDir(path)
  return oldFS.isDir(lgrub.thisOS..path)
end
function isReadOnly(path)
  return oldFS.isReadOnly(lgrub.thisOS..path)
end
function getName(path)
  return oldFS.getName(lgrub.thisOS..path)
end
function getDrive(path)
  return oldFS.getDrive(lgrub.thisOS..path)
end
function getSize(path)
  return oldFS.getSize(lgrub.thisOS..path)
end
function getFreeSpace(path)
  return oldFS.getFreeSpace(lgrub.thisOS..path)
end
function makeDir(path)
  return oldFS.makeDir(lgrub.thisOS..path)
end
function move(fromPath, toPath)
  return oldFS.move(lgrub.thisOS..fromPath, lgrub.thisOS..toPath)
end
function copy(fromPath, toPath)
  return oldFS.copy(lgrub.thisOS..fromPath, lgrub.thisOS..toPath)
end
function delete(path)
  return oldFS.delete(lgrub.thisOS..path)
end
function combine(basePath, localPath)
  return oldFS.combine(lgrub.thisOS..basePath, lgrub.thisOS..localPath
end
function open(path, mode)
  return oldFS.open(lgrub.thisOS..path, mode)
end
