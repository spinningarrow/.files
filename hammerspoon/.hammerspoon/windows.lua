local module = {}

module.init = function()
	DimensionsHistory = (function()
		local history = {}

		return {
			push = function(win)
				local f = win:frame()
				local originalDimensions = {
					x = f.x,
					y = f.y,
					w = f.w,
					h = f.h,
				}

				if history[win:id()] and not history[win:id()][20] then
					table.insert(history[win:id()], originalDimensions)
				else
					history[win:id()] = { originalDimensions }
				end
			end,

			pop = function(win)
				if not history[win:id()] then
					return nil
				end

				return table.remove(history[win:id()])
			end,
		}
	end)()

	updatedFrame = function(win, dimensionUpdates)
		local f = win:frame()
		local max = win:screen():frame()

		f.x = dimensionUpdates.x and dimensionUpdates.x(max, f) or f.x
		f.y = dimensionUpdates.y and dimensionUpdates.y(max, f) or f.y
		f.w = dimensionUpdates.w and dimensionUpdates.w(max, f) or f.w
		f.h = dimensionUpdates.h and dimensionUpdates.h(max, f) or f.h

		return f
	end

	updateWindow = function(dimensionUpdates)
		return function()
			local win = hs.window.focusedWindow()
			local f = win:frame()

			DimensionsHistory.push(win)
			win:setFrame(updatedFrame(win, dimensionUpdates))
		end
	end

	zero = function() return 0 end

	halfWidth = function(max) return max.w / 2 end
	maxWidth = function(max) return max.w end

	halfHeight = function(max) return max.h / 2 end
	maxHeight = function(max) return max.h end

	local prefix = { 'cmd', 'alt', 'ctrl' }

	hs.window.animationDuration = 0

	hs.hotkey.bind(prefix, 'H', updateWindow({
		x = zero,
		y = zero,
		w = halfWidth,
		h = maxHeight,
	}))

	hs.hotkey.bind(prefix, 'L', updateWindow({
		x = halfWidth,
		y = zero,
		w = halfWidth,
		h = maxHeight,
	}))

	hs.hotkey.bind(prefix, 'J', updateWindow({
		x = zero,
		y = function(max) return halfHeight(max) + 23 end, -- weird offset bug
		w = maxWidth,
		h = halfHeight,
	}))

	hs.hotkey.bind(prefix, 'K', updateWindow({
		x = zero,
		y = zero,
		w = maxWidth,
		h = halfHeight,
	}))

	hs.hotkey.bind(prefix, 'F', updateWindow({
		x = zero,
		y = zero,
		w = maxWidth,
		h = maxHeight,
	}))

	hs.hotkey.bind(prefix, 'C', updateWindow({
		x = function(max, f) return max.x + (max.w / 2 - f.w / 2) end,
		y = function(max, f) return max.y + (max.h / 2 - f.h / 2) end,
	}))

	hs.hotkey.bind(prefix, '=', updateWindow({
		x = function(max, f) return f.x - 25 end,
		y = function(max, f) return f.y - 25 end,
		w = function(max, f) return f.w + 50 end,
		h = function(max, f) return f.h + 50 end,
	}))

	hs.hotkey.bind(prefix, '-', updateWindow({
		x = function(max, f) return f.x + 25 end,
		y = function(max, f) return f.y + 25 end,
		w = function(max, f) return f.w - 50 end,
		h = function(max, f) return f.h - 50 end,
	}))

	hs.hotkey.bind(prefix, 'U', function()
	  local win = hs.window.focusedWindow()
	  local f = win:frame()

	  previousDimensions = DimensionsHistory.pop(win)

	  if not previousDimensions then return end

	  f.x = previousDimensions.x
	  f.y = previousDimensions.y
	  f.w = previousDimensions.w
	  f.h = previousDimensions.h

	  win:setFrame(f)
	end)
end

return module
