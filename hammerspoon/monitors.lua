local path = "http://192.168.1.103:8123/api/services/scene/turn_on"

-- local token = ""

local headers = {
  ["Authorization"] = "Bearer " .. token,
  ["Content-Type"] = "application/json"
}

local day_payload = [[ {"entity_id":"scene.officedaywork"} ]]
local night_payload = [[ {"entity_id":"scene.officenightwork"} ]]

screenWatcher = nil

function screenChanged(watcher)
  screenName = hs.screen.primaryScreen():name()

  if screenName == "LG ULTRAWIDE" then

    -- Checkout that its night
    hour = tonumber(os.date("%H"))

    -- Turn on Home Assistant Scene
    if hour >= 16 or hour < 7 then
      hs.http.post(path, night_payload, headers)
    else
      hs.http.post(path, day_payload, headers)
    end
  end
end

screenWatcher = hs.application.watcher.new(screenChanged)
screenWatcher:start()
