local module = {}

local split = function(string, separator)
	result = {}
	for match in string:gmatch('[^' .. separator .. ']+') do
		table.insert(result, match)
	end
	return result
end

module.init = function(flyPath, target)
	local flyWithTarget = flyPath .. ' -t ' .. target
	local concourseUrl = hs.execute(flyWithTarget .. ' targets | grep ' .. target .. ' | tr -s " " | cut -d" " -f2 | xargs echo -n')
	local dashboardUrl = concourseUrl .. '/dashboard'

	local menuState = function(jobStatus)
		if jobStatus == 'succeeded' then
			return 'on'
		elseif jobStatus == 'failed' then
			return 'off'
		elseif jobStatus == 'started' then
			return 'mixed'
		end
	end

	local statusIcon = function(menuState)
		if menuState == 'on' then
			return '🎉'
		else
			return '🔥'
		end
	end

	local jobs = function(pipeline)
		local jobsString = hs.execute(flyWithTarget .. ' jobs -p' .. pipeline .. ' | tr -s " " | cut -d" " -f1,3')
		local result = {
			title = pipeline,
			menu = {},
			state = 'on'
		}

		for _, job in ipairs(split(jobsString, '\n')) do
			local jobDetails = split(job, ' ')
			local state = menuState(jobDetails[2])

			if state == 'off' then result['state'] = 'off' end

			table.insert(result['menu'], { title = jobDetails[1], state = state })
		end

		return result
	end

	local menu = function()
		local pipelinesString = hs.execute(flyWithTarget .. ' pipelines | cut -d" " -f1')
		local result = {
			menu = {},
			state = 'on'
		}

		for _, pipeline in ipairs(split(pipelinesString, '\n')) do
			local subMenu = jobs(pipeline)

			if subMenu['state'] == 'off' then result['state'] = 'off' end

			table.insert(result['menu'], subMenu)
		end

		table.insert(result['menu'], { title = '-' })
		table.insert(result['menu'], { title = 'Dashboard', fn = function () hs.urlevent.openURL(dashboardUrl) end })

		return result
	end

	concourse = hs.menubar.new()

	local buildMenu = function()
		print('building menu...')
		concourse:setTitle('...')
		local m = menu()
		concourse:setTitle(statusIcon(m['state']))
		concourse:setMenu(m['menu'])
	end

	buildMenu()
	hs.timer.doEvery(90, buildMenu)
end

return module
