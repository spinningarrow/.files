local module = {}

module.init = function()
	calendarView = hs.webview.new()
	calendarView
		:url("https://calendar.google.com")
		:size({ h = 700, w = 700 })
		:shadow(true)
		:windowStyle('titled')
		:windowStyle('utility')
		:windowStyle('resizable')
		:windowStyle('closable')
		:allowTextEntry(true)
		:allowNewWindows(false)

	hs.hotkey.bind({'cmd', 'shift'}, 'delete', function()
		local mode = hs.screen.mainScreen():currentMode()
		calendarView:topLeft({ x = mode.w / 2 - 350, y = mode.h / 2 - 350 })

		if calendarView:isVisible() then
			calendarView:hide()
		else
			calendarView:show():bringToFront()
		end
	end)

end

return module
