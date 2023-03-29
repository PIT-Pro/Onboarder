#!/bin/bash

# Run script as user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
userjob=/Library/Addigy/user-job

# Show battery percentage in menubar 
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Tijd en datum
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d h:mm:ss"
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
# Show Time Machine in menubar
$userjob -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# Show Volume in menubar
$userjob -user $loggedInUser -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
 # Show VPN in menubar
$userjob -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
# Show VPN connected time in menubar
$userjob -user $loggedInUser -run defaults write com.apple.networkConnect VPNShowTime -string "1"