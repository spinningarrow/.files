require('launch-apps').init()

hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })

spoon.SpoonInstall:andUse('ClipboardTool', {
	start = true,
	hotkeys = {
		toggle_clipboard = { {'ctrl', 'alt', 'shift'}, 'B' }
	},
	config = {
		display_max_length = 40,
		frequency = 1,
		show_copied_alert = false,
		show_in_menubar = false,
		hist_size = 10
	}
})

spoon.SpoonInstall:andUse('WindowGrid', {
	config = {
		gridGeometries = { { '2x2' } }
	},
	hotkeys = {
		show_grid = { {'ctrl', 'alt', 'shift'}, 'G' }
	},
	start = true
})
