local windows = require('windows')
windows.init()

local configReloader = require('config-reloader')
configReloader.init()

local nowPlaying = require('now-playing')
nowPlaying.init()

local displaySleep = require('display-sleep')
displaySleep.init()

local launchApps = require('launch-apps')
launchApps.init()
