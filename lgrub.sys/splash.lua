-- Splash text!

-- Add more if you want!
local texts = {
   --MAXLEN-50---------------------------------------  
  "Lua means 'toilet' or 'bathroom' in Hawaiian!",
  "Teaching Lua all about itself!",
  "Lua means 'take' or 'assume' in Romainian!",
  "Lua means 'moon' in Galician!",
  "Lua means 'mention' or 'quote' in Celtic!",
  "Google thinks 'artlcifs' is an English word!",
  "1111",
  "Eclipse doesn't know what Lua means!",
  "Lua means 'moon' in Portuguese!",
  "Lua's from Brazil!",
  "poweroverwhelming",
  "Lbl AA:Goto AA",
  "print(splash.text[math.random(#splash.text)])",
  "GRUB: Making fun of physics since 1999!",
  "Harvey Dent: Can we trust him?",
  "To quote Hamlet Act III Scene III Line 92, 'No'", -- this isn't actually the correct line, but that's the one the meme points to
  "To quote Hamlet Act III Scene III Line 87, 'No'",
  "Kungani isikhathi sokubheka lokhu up?",
  "Manually added CraftOS",
  "Still doesn't support OneOS!",
  "Splash Text!",
  "Why'd I add this when there's a bug over there?",
  "git commit -m 'AAAAAAAAAAAAAA'",
  "Not as good as planned!",
  "Bacon number of 3!",
  "BEST TASTING MANGOES IN THE WORLD",
  "isSane = false",
  "SSSSSSSSSSSSSSSSSSSSSS",
  "while true do end",
  "/tp skwerlman 0 -2 0",
  "if ! [ $SANE ] ; then exit $EC fi",
  "COMMIT=$@",
  "cd rom/..",
  "Because Soaryn!",
  "_G.os = {}",
  "Thanks, Notch!",
  "'What's the wolf's name?' 'Uhh... Wolf.'",
  "This string is too long to display at the normal resolution, so we cut off the ends!",
  "It's the difference between <p /> and <ln />!",
  "Also try EnderAPI",
  "x = width/2 - text.len()/2",
  "Potatoes & milk have everything you need to live!",
  "1.0 breaks OneOS!",
  "/tp @a 0 -2 0",
  "Sledding with Tigers!",
  "//#--[[@;/*<--!\" Did I comment it?",
  "I used to be an adventurer like you!",
  "Semantically Versioned!",
}

local _w = term.getSize()
text = texts[math.random(#texts)]
text = text:sub(1,_w)
