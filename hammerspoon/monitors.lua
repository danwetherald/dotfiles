local path = "https://internetmoney.duckdns.org:8124/api/services/scene/turn_on"

local token = ""

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
    if hour >= 12 and hour <= 19 then
      -- hs.http.post(path, day_payload, headers)
    elseif hour <= 2 then
      -- hs.http.post(path, night_payload, headers)
    end
  end
end

screenWatcher = hs.application.watcher.new(screenChanged)
screenWatcher:start()
