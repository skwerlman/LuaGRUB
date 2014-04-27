-- Splash text!
-- Run, don't load!

local _w = term.getSize()
local splashtext = 'None!'

splash = {}

local function readJSON(loc)
  local h = GRUBRoot.FS.open(loc, 'r')
  local o = h.readAll()
  h.close()
  return JSON.decode(o)
end

local function writeJSON(loc, data)
  local h = GRUBRoot.FS.open(loc, 'w')
  h.write(JSON.encode(data))
  h.close()
end

function splash.addText(text)
  local splash = readJSON('/lgrub.sys/splash/splash.JSON')
  splash.texts = table.concat(splash.texts, text)
  writeJSON('/lgrub.sys/splash/splash.JSON', splash)
end

function splash.getText()
  local splash = readJSON('/lgrub.sys/splash/splash.JSON')
  splashtext = splash.texts[math.random(#splash.texts)]
  splashtext = splashtext:sub(1,_w)
end

function splash.text()
  return splashtext
end

function splash.printAllSplashtext()
  local h = GRUBRoot.FS.open('/lgrub.sys/splash/splash.JSON', 'r')
  local o = h.readAll()
  h.close()
  print(textutils.serialize(JSON.decode(o)))
end

splash.getText()
