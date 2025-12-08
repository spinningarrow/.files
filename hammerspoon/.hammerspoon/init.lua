hs.loadSpoon('SpoonInstall')
hs.loadSpoon('ControlEscape'):start()

spoon.SpoonInstall:andUse('ReloadConfiguration', { start = true })

-- Fennel support
package.path =
package.path .. ";" .. os.getenv("HOME") .. "/.hammerspoon/?.lua"

fennel = require('fennel')
fennel.path =
  package.path .. ";" .. os.getenv("HOME") .. "/.hammerspoon/?.fnl"
table.insert(package.loaders or package.searchers, fennel.searcher)

require 'main'

hs.alert.show('Config loaded')
