-- Function to perform a POST request
function postWebhook(url, body)
	hs.http.asyncPost(url, body, nil, function(status, body, headers)
		-- Debug print
		print(status, body)
	end)
end

-- Function to execute when the system finishes waking from sleep (including login)
function systemDidWake(event)
	if event == hs.caffeinate.watcher.systemDidWake then
		-- Morning alarm end
		-- postWebhook(
		-- 	"https://dlbjm66xta3foy583q9fvl3nruwkujeb.ui.nabu.casa/api/webhook/dan-s-iphone-morning-alarm-ended-7NmRbLaIevl5KoisIR0jcxJw",
		-- 	""
		-- )

		-- hs.alert("Morning music has been stopped", 1)
	end
end

-- Set up a watcher for system wake events
caffeinateWatcher = hs.caffeinate.watcher.new(systemDidWake)
caffeinateWatcher:start()
