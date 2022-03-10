#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

userjob=/Library/Addigy/user-job

#$userjob -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool false
#$userjob -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool false
#$userjob -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
#$userjob -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false