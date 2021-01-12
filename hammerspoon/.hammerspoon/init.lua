require('google-calendar').init()
require('launch-apps').init()
require('wallpaper').init()
require('yabai').init()

hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })

spoon.SpoonInstall:andUse("DeepLTranslate", {
	hotkeys = {
		translate = { {'ctrl', 'alt', 'shift'}, 'D' }
	}
})
