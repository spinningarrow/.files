local module = {}

function appLauncher(bundleID)
	return function()
		local focusedApp = hs.application.frontmostApplication()

		if focusedApp:bundleID() == bundleID then
			focusedApp:hide()
		else
			hs.application.launchOrFocusByBundleID(bundleID)
		end
	end
end

module.init = function()
	hs.hotkey.bind({'cmd', 'shift'}, 'space', appLauncher('com.apple.Terminal'))
end

return module
