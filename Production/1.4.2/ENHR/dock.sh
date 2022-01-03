#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

killall cfprefsd
#replace dock icons (dockutil moet geinstalleerd zijn/in policy staan)
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Maps' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Photos' $loggedInUser 
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'FaceTime' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Contacts' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Reminders' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Music' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'TV' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --remove 'Podcasts' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --add '/Applications/Google Chrome.app' --before 'Safari' $loggedInUser

if pgrep Microsoft Word > /dev/null
then
/Library/Addigy/user-job -user $loggedInUser -run dockutil --add '/Applications/Microsoft Word.app' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --add '/Applications/Microsoft Outlook.app' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --add '/Applications/Microsoft Excel.app' $loggedInUser
/Library/Addigy/user-job -user $loggedInUser -run dockutil --add '/Applications/Microsoft Powerpoint.app' $loggedInUser
else
    echo "Office not installed"
fi

# Don't show recent applications in Dock
 /Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

killall Dock