hs.window.animationDuration = 0

local oldIdXYWH = {}

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}

  f.x = max.x + (max.w / 2 - f.w / 2)
  f.y = max.y + (max.h / 2 - f.h / 2)
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  if win:id() ~= oldIdXYWH[1] then
	  return
  end

  f.x = oldIdXYWH[2]
  f.y = oldIdXYWH[3]
  f.w = oldIdXYWH[4]
  f.h = oldIdXYWH[5]
  win:setFrame(f)
end)
