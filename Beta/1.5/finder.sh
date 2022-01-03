#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

userjob=/Library/Addigy/user-job

#Show icons for HDD, servers, removable media
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Always show scrollbars
$userjob -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Show Status bar in Finder
$userjob -user $loggedInUser -run defaults write com.apple.finder ShowStatusBar -bool true
# Make Home folder standard Finder folder
$userjob -user $loggedInUser -run defaults write com.apple.finder NewWindowTarget PfHm
# Show all filename extensions
$userjob -user $loggedInUser -run defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# When performing a search, search the current folder by default
$userjob -user $loggedInUser -run defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


