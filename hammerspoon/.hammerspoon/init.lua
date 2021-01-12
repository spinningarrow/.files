require('google-calendar').init()
require('launch-apps').init()
require('wallpaper').init()
require('windows').init()
require('yabai').init()

hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })

spoon.SpoonInstall:andUse("DeepLTranslate", {
	hotkeys = {
		translate = { {'ctrl', 'alt', 'shift'}, 'D' }
	}
})

spoon.SpoonInstall:andUse('WindowGrid', {
	config = {
		gridGeometries = { { '4x4' } }
	},
	hotkeys = {
		show_grid = { {'ctrl', 'alt', 'shift'}, 'G' }
	},
	start = true
})
