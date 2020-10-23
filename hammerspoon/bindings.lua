local hyper = {
  'cmd',
  'ctrl'
}

local applicationHotkeys = {
  s = 'Spotify',
  k = 'kitty',
  c = 'Google Chrome'
}

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

hs.hotkey.bind({}, "f8", function()
  hs.spotify.playpause()
end)

hs.hotkey.bind(hyper, "escape", function()
  hs.reload()
end)
