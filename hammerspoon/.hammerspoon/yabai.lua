local module = {}

module.init = function()
	hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'y', function()
		local t = hs.task.new('/usr/local/bin/yabai', function() end, {'-m', 'window', '--toggle', 'float'})
		t:start()
	end)
end

return module
