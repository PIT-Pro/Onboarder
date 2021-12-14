#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.2 by Thomas Boom | PIT Pro B.V.

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

if pgrep Microsoft Word > /dev/null
then
    /usr/local/bin/dockutil --add "/Applications/Microsoft Word.app"
    /usr/local/bin/dockutil --add "/Applications/Microsoft Outlook.app"
    /usr/local/bin/dockutil --add "/Applications/Microsoft Excel.app"
    /usr/local/bin/dockutil --add "/Applications/Microsoft Powerpoint.app"
else
    echo "Office not installed"
fi

# Don't show recent applications in Dock
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

