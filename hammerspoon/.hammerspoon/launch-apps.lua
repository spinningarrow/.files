local module = {}

appLauncher = function (bundleID)
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
	hs.hotkey.bind({'cmd', 'shift'}, 'space', appLauncher('com.googlecode.iterm2'))
	hs.hotkey.bind({'ctrl', 'alt', 'shift'}, 'space', appLauncher('io.dynalist'))
end

return module
