#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom, Jeroen Potters | PIT Pro B.V.

# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#Show icons for HDD, servers, removable media
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Always show scrollbars
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Show Path bar in Finder
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Show Status bar in Finder
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowStatusBar -bool true
# Maak home folder de standaard folder als je Finder opent
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder NewWindowTarget PfHm
# Show all filename extensions
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# When performing a search, search the current folder by default
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Save to disk (not to iCloud) by default
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Prevent Photos from opening automatically when devices are plugged in
/Library/Addigy/user-job -user $loggedInUser -run defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true 

#kill all services
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
