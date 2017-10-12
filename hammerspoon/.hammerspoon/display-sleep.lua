local module = {}

module.init = function()
	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "s", function()
		hs.execute("pmset displaysleepnow")
	end)
end

return module
