local module = {}

module.init = function()
	local oldIdXYWH = {}

	originalDimensions = function(win, f)
		  oldIdXYWH = {win:id(), f.x, f.y, f.w, f.h}
		  return oldIdXYWH
	end

	updateDimensions = function(win, f, dimensionUpdates)
		local max = win:screen():frame()

		f.x = dimensionUpdates.x and dimensionUpdates.x(max, f) or f.x
		f.y = dimensionUpdates.y and dimensionUpdates.y(max, f) or f.y
		f.w = dimensionUpdates.w and dimensionUpdates.w(max, f) or f.w
		f.h = dimensionUpdates.h and dimensionUpdates.h(max, f) or f.h

		win:setFrame(f)
	end

	updateWindow = function(dimensionUpdates)
		return function()
			local win = hs.window.focusedWindow()
			local f = win:frame()

			oldIdXYWH = originalDimensions(win, f)
			updateDimensions(win, f, dimensionUpdates)
		end
	end

	maxX = function(max) return max.x end
	maxY = function(max) return max.y end

	halfWidth = function(max) return max.w / 2 end
	maxWidth = function(max) return max.w end

	halfHeight = function(max) return max.h / 2 end
	maxHeight = function(max) return max.h end

	hs.window.animationDuration = 0

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", updateWindow({
		["x"] = maxX,
		["y"] = maxY,
		["w"] = halfWidth,
		["h"] = maxHeight,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", updateWindow({
		["x"] = halfWidth,
		["y"] = maxY,
		["w"] = halfWidth,
		["h"] = maxHeight,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", updateWindow({
		["x"] = maxX,
		["y"] = halfHeight,
		["w"] = maxWidth,
		["h"] = halfHeight,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", updateWindow({
		["x"] = function(max, f) return max.x + (max.w / 2 - f.w / 2) end,
		["y"] = function(max, f) return max.y + (max.h / 2 - f.h / 2) end,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "=", updateWindow({
		["x"] = function(max, f) return f.x - 25 end,
		["y"] = function(max, f) return f.y - 25 end,
		["w"] = function(max, f) return f.w + 50 end,
		["h"] = function(max, f) return f.h + 50 end,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "-", updateWindow({
		["x"] = function(max, f) return f.x + 25 end,
		["y"] = function(max, f) return f.y + 25 end,
		["w"] = function(max, f) return f.w - 50 end,
		["h"] = function(max, f) return f.h - 50 end,
	}))

	hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
	  local win = hs.window.focusedWindow()
	  local f = win:frame()

	  if win:id() ~= oldIdXYWH[1] then
		  return
	  end

	  f.x = oldIdXYWH[2]
	  f.y = oldIdXYWH[3]
	  f.w = oldIdXYWH[4]
	  f.h = oldIdXYWH[5]
	  win:setFrame(f)
	end)
end

return module
