#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.31 version 1.9 by Thomas Boom | PIT Pro B.V.

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
OSbuild=$(sw_vers -ProductVersion)

#remove all items from Dock
 $userjob --user localadmin -run $dockutil --remove all /Users/localadmin
killall Dock

sleep 5

#replace dock macOS icons (Dockutil needs to be installed)
$userjob -user localadmin -run $dockutil --add "/System/Applications/Launchpad.app" --no-restart /Users/localadmin

#check if Mac is running Monterey or Ventura..
if [[ $OSbuild = 13.* ]] ; then
    echo "Running Ventura.."
    $userjob -user localadmin -run $dockutil --add "/System/Applications/System Settings.app" --no-restart /Users/localadmin
    $userjob -user localadmin -run $dockutil --add "/System/Cryptexes/App/System/Applications/Safari.app" --no-restart /Users/localadmin
else
    echo "Running Monterey or lower.."
    $userjob -user localadmin -run $dockutil --add "/System/Applications/System Preferences.app" --no-restart /Users/localadmin
    $userjob -user localadmin -run $dockutil --add "/Applications/Safari.app" --no-restart /Users/localadmin
fi

$userjob -user localadmin -run $dockutil --add "/System/Applications/Utilities/Terminal.app" --no-restart /Users/localadmin

sleep 2

# Don't show recent applications in Dock
$userjob -user localadmin -run defaults write com.apple.dock show-recents -bool false 

killall cfprefsd
killall Dock
exit 0