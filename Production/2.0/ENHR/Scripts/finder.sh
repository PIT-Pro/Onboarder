#!/bin/bash

#Variables
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

#Functions
run_Finder(){
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowStatusBar -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder NewWindowTarget PfHm
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowAllExtensions -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
}

run_Finder