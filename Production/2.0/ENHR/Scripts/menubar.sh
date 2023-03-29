#!/bin/bash

#Variables
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
userjob=/Library/Addigy/user-job

#Functions
runMenubar(){
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d h:mm:ss"
$userjob -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
$userjob -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
$userjob -user $loggedInUser -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
$userjob -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
$userjob -user $loggedInUser -run defaults write com.apple.networkConnect VPNShowTime -string "1"
}

runMenubar