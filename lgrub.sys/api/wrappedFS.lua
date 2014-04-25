-- run 'wrappedFS.init(fs) fs = wrappedFS' after 'os.loadAPI'

local oldFS = fs

--wrapped functions
function list(path)
  return oldFS.list(lgrub.getOS()..path)
end
function exists(path)
  return oldFS.exists(lgrub.getOS()..path)
end
function isDir(path)
  return oldFS.isDir(lgrub.getOS()..path)
end
function isReadOnly(path)
  return oldFS.isReadOnly(lgrub.getOS()..path)
end
function getName(path)
  return oldFS.getName(lgrub.getOS()..path)
end
function getDrive(path)
  return oldFS.getDrive(lgrub.getOS()..path)
end
function getSize(path)
  return oldFS.getSize(lgrub.getOS()..path)
end
function getFreeSpace(path)
  return oldFS.getFreeSpace(lgrub.getOS()..path)
end
function makeDir(path)
  return oldFS.makeDir(lgrub.getOS()..path)
end
function move(fromPath, toPath)
  return oldFS.move(lgrub.getOS()..fromPath, lgrub.getOS()..toPath)
end
function copy(fromPath, toPath)
  return oldFS.copy(lgrub.getOS()..fromPath, lgrub.getOS()..toPath)
end
function delete(path)
  return oldFS.delete(lgrub.getOS()..path)
end
function combine(basePath, localPath)
  return oldFS.combine(lgrub.getOS()..basePath, lgrub.getOS()..localPath)
end
function open(path, mode)
  return oldFS.open(lgrub.getOS()..path, mode)
end
