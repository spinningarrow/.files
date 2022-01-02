require('google-calendar').init()
require('launch-apps').init()
require('wallpaper').init()
require('yabai').init()

hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()
ud = hs.loadSpoon('URLDispatcher')

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })
spoon.SpoonInstall:andUse('URLDispatcher', { start = true })

spoon.SpoonInstall:andUse("DeepLTranslate", {
	hotkeys = {
		translate = { {'ctrl', 'alt', 'shift'}, 'D' }
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

local w = hs.application.watcher.new(function (name, event, app)
	print('application watcher triggered', name)

	if (name ~= 'Safari') then
		return
	end

	if (event == hs.application.watcher.hidden) then
		ud.default_handler = 'com.google.Chrome'
		print('setting handler to chrome', name, event)
	else
		ud.default_handler = 'com.apple.Safari'
		print('setting handler to safari', name, event)
	end
end)

w:start()
