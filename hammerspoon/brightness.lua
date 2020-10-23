appWatcher = nil

function appChanged(appName, eventType, appObject)
  hour = tonumber(os.date("%H"))

  if hour > 18 or hour < 7 then
    if (eventType == hs.application.watcher.activated) then
      if (appName == "kitty") then
        hs.brightness.set(40)
      else
        hs.brightness.set(1)
      end
    end
  end

end

appWatcher = hs.application.watcher.new(appChanged)
appWatcher:start()
