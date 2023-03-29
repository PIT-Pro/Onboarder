#!/bin/bash

#Variables
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
userjob=/Library/Addigy/user-job

#Functions
run_Finder(){
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowStatusBar -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder NewWindowTarget PfHm
$userjob -user $loggedInUser -run defaults write NSGlobalDomain AppleShowAllExtensions -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
}

run_Finder