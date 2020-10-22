local hyper = {
  'cmd',
  'ctrl'
***REMOVED***

local applicationHotkeys = {
  s = 'Spotify',
  k = 'kitty',
  c = 'Google Chrome'
***REMOVED***

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
***REMOVED***)
***REMOVED***

hs.hotkey.bind({***REMOVED***, "f8", function()
  hs.spotify.playpause()
***REMOVED***)
