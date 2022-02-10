wifiWatcher = nil
homeSSID = "Internet Money"
lastSSID = hs.wifi.currentNetwork()

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    -- local note = hs.notify.new({
    --   title="Connected to WiFi",
    --   informativeText="Now connected to " .. newSSID
    -- }):send()

    -- hs.timer.doAfter(3, function ()
    --   note:withdraw()
    --   note = nil
    -- end)

    if newSSID == homeSSID and lastSSID ~= homeSSID then
        -- We just joined our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(25)
    elseif newSSID ~= homeSSID and lastSSID == homeSSID then
        -- We just departed our home WiFi network
        hs.audiodevice.defaultOutputDevice():setVolume(5)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
