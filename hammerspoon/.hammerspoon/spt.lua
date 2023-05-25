local module = {}

function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

module.init = function()
	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, 'p', function ()
		local output, status = hs.execute('/opt/homebrew/bin/spt playback --toggle')
		print(output, status)
		hs.alert.show(trim(output))
	end)

	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, '[', function ()
		local output, status = hs.execute('/opt/homebrew/bin/spt playback --previous')
		print(output, status)
		hs.alert.show(trim(output))
	end)

	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, ']', function ()
		local output, status = hs.execute('/opt/homebrew/bin/spt playback --next')
		print(output, status)
		hs.alert.show(trim(output))
	end)

	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, '\\', function ()
		local output, status = hs.execute('/opt/homebrew/bin/spt playback --status')
		print(output, status)
		hs.alert.show(trim(output))
	end)
end

return module
