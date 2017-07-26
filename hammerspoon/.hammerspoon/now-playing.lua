local module = {}

module.init = function()
	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "p", function()
		local success, result = hs.osascript.javascript([[
			let spotify = Application('Spotify')
			const stateIndicator = spotify => spotify.playerState() === 'playing' ? '▶️' : '⏸'
			spotify.running() ?
				`${stateIndicator(spotify)} ${spotify.currentTrack.artist()}: ${spotify.currentTrack.name()}` :
				'Spotify is not running'
		]])

		if success then
			hs.alert.show(result)
		else
			hs.alert.show("Unable to fetch song information.")
		end
	end)
end

return module
