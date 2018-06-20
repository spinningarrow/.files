local module = {}

local keyboardWatcher = hs.usb.watcher.new(function (event)
	if event.productName ~= 'DZ60' then
		return
	elseif event.eventType == 'added' then
		hs.application.open('org.pqrs.Karabiner-Menu')
	else
		local app = hs.application.find('org.pqrs.Karabiner-Menu')
		if app then app:kill() end
	end
end)

module.init = function()
	keyboardWatcher:start()
end

return module
