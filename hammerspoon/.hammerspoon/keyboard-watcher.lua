local module = {}

local keyboardWatcher = hs.usb.watcher.new(function (event)
	if event.productName ~= 'DZ60' then
		return
	elseif event.eventType == 'added' then
		local app = hs.application.open('org.pqrs.Karabiner-Elements.Preferences')
		app:kill()
	else
		local app = hs.application.find('org.pqrs.Karabiner-Menu')
		if app then app:kill() end
		hs.execute('launchctl bootout gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server')
		hs.execute('launchctl disable gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server')
	end
end)

module.init = function()
	keyboardWatcher:start()
end

return module
