local module = {}

local split = function(string, separator)
	result = {}
	for match in string:gmatch('[^' .. separator .. ']+') do
		table.insert(result, match)
	end
	return result
end

module.init = function(dashboardUrl, target)
	local statusIcon = function(menuState)
		if menuState == 'on' then
			return '🎉'
		else
			return '🔥'
		end
	end

	local menu = function(pipelinesString)
		local result = {
			menu = {},
			state = 'on'
		}

		for _, pipeline in ipairs(split(pipelinesString, '\n')) do
			details = split(pipeline, ' ')
			local state
			if details[2] == '1' then
				state = 'on'
			else
				state = 'off'
			end

			table.insert(result['menu'], {
				title=details[1],
				fn = function () hs.urlevent.openURL(dashboardUrl) end,
				state=state
			})
			if state == 'off' then result['state'] = 'off' end
		end

		table.insert(result['menu'], { title = '-' })
		table.insert(result['menu'], { title = 'Dashboard', fn = function () hs.urlevent.openURL(dashboardUrl) end })

		return result
	end

	concourse = hs.menubar.new()
	concourse:setTitle('...')

	local buildMenu = function()
		hs.task.new('/usr/local/bin/fish', function(exitCode, pipelinesString, stdErr)
			print('building menu...')
			local m = menu(pipelinesString)
			concourse:setTitle(statusIcon(m['state']))
			concourse:setMenu(m['menu'])
		end, { './pipelines.fish', target }):start()
	end

	buildMenu()
	menuTimer = hs.timer.doEvery(60, buildMenu)
end

return module
