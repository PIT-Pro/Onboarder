#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#replace dock icons (dockutil moet geinstalleerd zijn/in policy staan)
dockutil --remove "Maps" /Users/$loggedInUser
dockutil --remove "Photos" /Users/$loggedInUser 
dockutil --remove "FaceTime" /Users/$loggedInUser
dockutil --remove "Contacts" /Users/$loggedInUser
dockutil --remove "Reminders" /Users/$loggedInUser
dockutil --remove "Music" /Users/$loggedInUser
dockutil --remove "TV" /Users/$loggedInUser
dockutil --remove "Podcasts" /Users/$loggedInUser
dockutil --add "/Applications/Google Chrome.app" --before "Safari" /Users/$loggedInUser

if pgrep -u Microsoft Word > /dev/null
then
dockutil --add "/Applications/Microsoft Word.app" /Users/$loggedInUser
dockutil --add "/Applications/Microsoft Outlook.app" /Users/$loggedInUser
dockutil --add "/Applications/Microsoft Excel.app" /Users/$loggedInUser
dockutil --add "/Applications/Microsoft Powerpoint.app" /Users/$loggedInUser
else
    echo "Office not installed"
fi

# Don't show recent applications in Dock
 /Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

