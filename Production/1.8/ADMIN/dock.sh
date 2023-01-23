#!/bin/bash

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil

#remove all items from Dock
 $userjob --user localadmin -run $dockutil --remove all /Users/localadmin
killall Dock

sleep 5

#replace dock macOS icons (Dockutil needs to be installed)
$userjob -user localadmin -run $dockutil --add "/System/Applications/Launchpad.app" --no-restart /Users/localadmin
$userjob -user localadmin -run $dockutil --add "/Applications/Safari.app" --no-restart /Users/localadmin
$userjob -user localadmin -run $dockutil --add "/System/Applications/System Preferences.app" --no-restart /Users/localadmin
$userjob -user localadmin -run $dockutil --add "/System/Applications/Utilities/Terminal.app" --no-restart /Users/localadmin

sleep 2

# Don't show recent applications in Dock
$userjob -user localadmin -run defaults write com.apple.dock show-recents -bool false 

killall Dock
exit 0