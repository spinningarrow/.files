local windows = require('windows')
windows.init()

local configReloader = require('config-reloader')
configReloader.init()

local displaySleep = require('display-sleep')
displaySleep.init()

local launchApps = require('launch-apps')
launchApps.init()

local keyboardWatcher = require('keyboard-watcher')
keyboardWatcher.init()

local wallpaper = require('wallpaper')
wallpaper.init()

local concourse = require('concourse')
concourse.init()
