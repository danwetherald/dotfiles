local path = "http://192.168.1.103:8123/api/services/scene/turn_on"

local token = ""

local headers = {
  ["Authorization"] = "Bearer " .. token,
  ["Content-Type"] = "application/json"
}

local payload = [[ {"entity_id":"scene.officenightwork"} ]]

sessionWatcher = nil

function sessionChanged(eventType)
  hour = tonumber(os.date("%H"))
  
  -- After 6pm before 7am
  if hour > 18 or hour < 7 then
    if (eventType == hs.caffeinate.watcher.screensDidUnlock) then
      hs.http.post(path, payload, headers)
    end
  end

end

sessionWatcher = hs.caffeinate.watcher.new(sessionChanged)
sessionWatcher:start()
