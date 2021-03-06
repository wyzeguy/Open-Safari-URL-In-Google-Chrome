tell application "System Events"
		tell application process "Safari"
			set numSafariWindows to count of windows
		end tell
		set isChromeRunning to (name of processes) contains "Google Chrome"
		if (isChromeRunning) then
			tell application process "Google Chrome"
				set numChromeWindows to count of windows
			end tell
		else
			set numChromeWindows to 1
		end if
	end tell
	tell application "Safari"
		if (numSafariWindows > 0) then
			set currentURL to URL of current tab of window 1
			if ((currentURL does not contain "http://") and (currentURL does not contain "https://")) then
				return
			end if
		else
			return
		end if
	end tell
	tell application "Google Chrome"
		activate
		if ((count of windows) > 0) then
			get URL of active tab of window 1
			if (URL of active tab of window 1 is "chrome://newtab/") then
				set targetTab to active tab of window 1
			else
				make new window
				set targetTab to active tab of window 1
			end if
		else
			make new window
			set targetTab to active tab of window 1
		end if
		set URL of targetTab to currentURL
	end tell