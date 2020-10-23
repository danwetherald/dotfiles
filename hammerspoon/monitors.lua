local path = "http://192.168.1.103:8123/api/services/scene/turn_on"

-- local token = ""

local headers = {
  ["Authorization"] = "Bearer " .. token,
  ["Content-Type"] = "application/json"
}

local payload = [[ {"entity_id":"scene.officenightwork"} ]]

screenWatcher = nil

function screenChanged(watcher)
  screenName = hs.screen.primaryScreen():name()

  if screenName == "LG ULTRAWIDE" then

    -- Checkout that its night
    hour = tonumber(os.date("%H"))
    if hour > 18 or hour < 7 then
      -- Turn on Home Assistant Scene
      hs.http.post(path, payload, headers)
    end
  end
end

screenWatcher = hs.application.watcher.new(screenChanged)
screenWatcher:start()
