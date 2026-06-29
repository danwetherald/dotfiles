local hyper = {
	"cmd",
	"ctrl",
}

hs.window.animationDuration = 0.0

local function moveFocused(unit)
	local win = hs.window.focusedWindow()
	if win then
		win:move(unit, nil, true, 0)
	end
end

local function moveToNextScreen()
	local win = hs.window.focusedWindow()
	if win then
		win:moveToScreen(win:screen():next(), false, true, 0)
	end
end

hs.hotkey.bind(hyper, "left", function()
	moveFocused(hs.layout.left50)
end)

hs.hotkey.bind(hyper, "right", function()
	moveFocused(hs.layout.right50)
end)

hs.hotkey.bind(hyper, "up", function()
	moveFocused(hs.layout.top50)
end)

hs.hotkey.bind(hyper, "down", function()
	moveFocused(hs.layout.bottom50)
end)

hs.hotkey.bind(hyper, "f", function()
	moveFocused(hs.layout.maximized)
end)

hs.hotkey.bind(hyper, "n", moveToNextScreen)

-- Finder Show All Windows
function applicationWatcher(appName, eventType, appObject)
	if eventType == hs.application.watcher.activated then
		if appName == "Finder" then
			-- Bring all Finder windows forward when one gets activated
			appObject:selectMenuItem({ "Window", "Bring All to Front" })
		end
	end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
