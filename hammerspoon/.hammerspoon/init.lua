require('google-calendar').init()
require('launch-apps').init()
require('wallpaper').init()
require('yabai').init()
require('spt').init()

hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })

spoon.SpoonInstall:andUse('WindowGrid', {
	config = {
		gridGeometries = { { '2x2' } }
	},
	hotkeys = {
		show_grid = { {'ctrl', 'alt', 'shift'}, 'G' }
	},
	start = true
})
