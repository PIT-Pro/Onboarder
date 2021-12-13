#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom | PIT Pro B.V.

#stopt logged in user in variabele
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Show battery percentage in menubar (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Tijd en datum (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d h:mm:ss"
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
# Show Bluetooth in menubar (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# Show Time Machine in menubar (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# Show Volume in menubar (werkt in Big Sur/Monterey)
 /Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
 # Show VPN in menubar (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
# Show VPN connected time in menubar (werkt in Big Sur/Monterey)
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.networkConnect VPNShowTime -string "1"

#kill all services
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
