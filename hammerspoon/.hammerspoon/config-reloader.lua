local module = {}

module.init = function()
	function reloadConfig(files)
		doReload = false
		for _,file in pairs(files) do
			if file:sub(-4) == ".lua" then
				doReload = true
			end
		end
		if doReload then
			hs.reload()
		end
	end

	local myWatcher = hs.pathwatcher.new('.', reloadConfig):start()
	hs.alert.show("Config loaded")
end

return module
