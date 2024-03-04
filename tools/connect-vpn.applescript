#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title connect-vpn
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author sungjk
# @raycast.authorURL https://raycast.com/sungjk

if application "Ivanti Secure Access" is running then
	-- no op
else
	tell application "Ivanti Secure Access" to activate
	delay 1 --wait for init
end if

tell application "System Events" to tell process "Ivanti Secure Access"
	tell menu bar item 1 of menu bar 2
		click
		click menu item "페이 VPN" of menu 1
		keystroke return
	end tell
	log "Open Ivanti Secure Access..."
end tell
