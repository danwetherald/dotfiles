-- Resize windows
local hyper = {
  'cmd',
  'ctrl'
***REMOVED***

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.0

spoon.MiroWindowsManager:bindHotkeys({
  up = { hyper, "up" ***REMOVED***,
  right = { hyper, "right" ***REMOVED***,
  down = { hyper, "down" ***REMOVED***,
  left = { hyper, "left" ***REMOVED***,
  fullscreen = { hyper, "f" ***REMOVED***
***REMOVED***)

-- Finder Show All Windows
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Finder") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"***REMOVED***)
    ***REMOVED***
***REMOVED***
***REMOVED***
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
