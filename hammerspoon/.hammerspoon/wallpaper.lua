local module = {}

module.init = function()
	hs.hotkey.bind({'alt', 'ctrl', 'shift'}, 'w', function()
		local success, result, err = hs.osascript.applescriptFromFile('./scripts/wallpaper.applescript')
	end)
end

return module
