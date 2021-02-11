local module = {}

module.init = function()
	hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'y', function()
		local t = hs.task.new('/bin/zsh', function() end, {'-lc', 'yabai -m window --toggle float'})
		t:start()
	end)
end

return module
