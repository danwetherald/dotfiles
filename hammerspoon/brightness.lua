appWatcher = nil

function appChanged(appName, eventType, appObject)
  hour = tonumber(os.date("%H"))
  
  if hour > 20 or hour < 7 then
    if (eventType == hs.application.watcher.activated) then
      if (appName == "kitty") then
        hs.brightness.set(40)
      else
        hs.brightness.set(1)
  ***REMOVED***
***REMOVED***
***REMOVED***

***REMOVED***

appWatcher = hs.application.watcher.new(appChanged)
appWatcher:start()
