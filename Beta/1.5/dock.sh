#!/bin/bash
#Thanks Tobias Morrison!
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
sleep=/bin/sleep

loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#replace dock icons (dockutil moet geinstalleerd zijn/in policy staan)
$userjob -user $loggedInUser -run dockutil --remove "Maps" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "Photos" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "FaceTime" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "Contacts" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "Reminders" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "Music" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "TV" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --remove "Podcasts" /Users/$loggedInUser
$userjob -user $loggedInUser -run dockutil --add "/Applications/Google Chrome.app" --before "Safari" /Users/$loggedInUser

if pgrep -u $loggedInUser Microsoft Word > /dev/null
then
    $userjob -user $loggedInUser -run dockutil --add "/Applications/Microsoft Word.app" /Users/$loggedInUser
    $userjob -user $loggedInUser -run dockutil --add "/Applications/Microsoft Outlook.app" /Users/$loggedInUser
    $userjob -user $loggedInUser -run dockutil --add "/Applications/Microsoft Excel.app" /Users/$loggedInUser
    $userjob -user $loggedInUser -run dockutil --add "/Applications/Microsoft Powerpoint.app" /Users/$loggedInUser
else
    echo "Office not installed"
fi

# Don't show recent applications in Dock
$user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

