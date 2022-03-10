#!/bin/bash
#Thanks Tobias Morrison!
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
sleep=/bin/sleep
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
 
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
$userjob -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false 

