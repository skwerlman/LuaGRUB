local tOS = lgrub.listOSes()
local tOSes, tPaths

for n, osData in ipairs(tOS) do
  tOSes[n] = osData[1]
  tPaths[n] = osData[2]
end
table.insert(tOSes, 'Shutdown')
local nTermX, nTermY = term.getSize()
local sSeperator = (" "):rep(nTermX) -- Create a separator string with the size of the terminal
 
function printColor(text, fg, bg)
  term.setBackgroundColor(bg)
  term.setTextColor(fg)
  print(text)
end
 
table.insert(tChoices, 'Shutdown')
 
-- Do the above for the remaining
local continue = true
local nSelection = 0 -- The current selection defaults at 0
while continue do
  term.setCursorPos(1, 1)
  term.clear()
  Drawing.DrawCharactersCenter(nil, 1, nil, nil, 'LuaGrub v'..lgrub.version)
  printColor("", colors.black, colors.lightGray)
  printColor(sSeperator, colors.lightGray, colors.lightGray)
  for nLine = 0, #tOSes do
    local sLine = " "
    local fgColor = colors.white
    if nSelection == nLine then
      sLine = ">"
      fgColor = colors.yellow
    end
    sLine = sLine .. " " .. tOSes[nLine]
    printColor(sLine, fgColor, colors.black)
  end
  local sEvent, nKey = os.pullEvent("key")
  if nKey == 200 or nKey == 17 then
    if tOSes[nSelection - 1] then
      nSelection = nSelection - 1
    else
      nSelection = #tOSes
    end
  elseif nKey == 208 or nKey == 31  then
    if tOSes[nSelection + 1] then
      nSelection = nSelection + 1
    else
      nSelection = 1
    end
  elseif nKey == 28 then
    if tPaths[nSelection] then
      continue = false
    else
      printError("Error: Selection out of bounds: ", nSelection)
      nSelection = 1
    end
  end
end
return tPaths[nSelection]