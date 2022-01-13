local module = {}

function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

module.init = function()
	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, 'o', function ()
		print('hello')
		local output, status = hs.execute('/opt/homebrew/bin/spt pb -s')
		print(output, status)
		hs.alert.show(trim(output))
	end)


	hs.hotkey.bind({'ctrl', 'cmd', 'shift'}, 'p', function ()
		print('hello')
		local output, status = hs.execute('/opt/homebrew/bin/spt pb -t')
		print(output, status)
		hs.alert.show(trim(output))
	end)
end

return module
