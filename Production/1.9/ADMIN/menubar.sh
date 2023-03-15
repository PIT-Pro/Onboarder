#!/bin/bash

# Run script as user
userjob=/Library/Addigy/user-job

# Show battery percentage in menubar (works in Big Sur/Monterey)
$userjob -user localadmin -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Tijd en datum (works in Big Sur/Monterey)
$userjob -user localadmin -run defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d h:mm:ss"
$userjob -user localadmin -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
# Show Time Machine in menubar (works in Big Sur/Monterey)
$userjob -user localadmin -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# Show Volume in menubar (works in Big Sur/Monterey)
$userjob -user localadmin -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
 # Show VPN in menubar (works in Big Sur/Monterey)
$userjob -user localadmin -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
# Show VPN connected time in menubar (works in Big Sur/Monterey)
$userjob -user localadmin -run defaults write com.apple.networkConnect VPNShowTime -string "1"