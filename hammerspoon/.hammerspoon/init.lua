local windows = require('windows')
windows.init()

local configReloader = require('config-reloader')
configReloader.init()

local nowPlaying = require('now-playing')
nowPlaying.init()

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "l", function()
	hs.caffeinate.lockScreen()
end)
