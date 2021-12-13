#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom, Jeroen Potters | PIT Pro B.V.

# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#replace dock icons (dockutil moet geinstalleerd zijn/in policy staan)
/usr/local/bin/dockutil --remove "Maps" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Photos" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "FaceTime" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Contacts" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Reminders" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Music" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "TV" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Podcasts" /Users/$loggedInUser
/usr/local/bin/dockutil --add "/Applications/Google Chrome.app" --before "Safari" /Users/$loggedInUser

# Don't show recent applications in Dock
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

#kill all services
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
