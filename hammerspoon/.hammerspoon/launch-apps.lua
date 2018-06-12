local module = {}

module.init = function()
	hs.hotkey.bind({"cmd", "shift"}, "space", function()

		local focusedApp = hs.application.frontmostApplication()
		if focusedApp:name() == 'iTerm2' then
			focusedApp:hide()
		else
			hs.application.open("iTerm")
		end
	end)

	hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'space', function()

		local focusedApp = hs.application.frontmostApplication()
		if focusedApp:name() == 'Dynalist' then
			focusedApp:hide()
		else
			hs.application.open('Dynalist')
		end
	end)
end

return module
