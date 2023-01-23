#!/bin/bash

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
 
 #remove all items from Dock
 $userjob --user $loggedInUser -run $dockutil --remove all /Users/$loggedInUser
killall Dock

sleep 5

#replace dock macOS icons ($dockutil moet geinstalleerd zijn/in policy staan)
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/Launchpad.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/Applications/Safari.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/System Preferences.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/Utilities/Terminal.app" --no-restart /Users/$loggedInUser

sleep 2

# Don't show recent applications in Dock
$userjob -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false 

killall Dock
exit 0








