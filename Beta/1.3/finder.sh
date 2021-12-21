#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.2 by Thomas Boom | PIT Pro B.V.

# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#Show icons for HDD, servers, removable media
echo "Show external drives connected on desktop" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true)
echo "Show hard drives connected on desktop" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true)
echo "Show mounted servers on desktop" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true)
echo "Show removable media on desktop" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true)
# Always show scrollbars
echo "Always show scrollbars in Finder" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always")
# Show Status bar in Finder
echo "Show status bar in Finder" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowStatusBar -bool true)
# Maak home folder de standaard folder als je Finder opent
echo "Make Home folder standard openingfolder in Finder" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder NewWindowTarget PfHm)
# Show all filename extensions
echo "Show all filename extensions" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowAllExtensions -bool true)
# When performing a search, search the current folder by default
echo "When performing a search in Finder, search the current folder by default" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder FXDefaultSearchScope -string "SCcf")
# Save to disk (not to iCloud) by default
echo "Save to Disk (not to iCloud) by default" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false")
# Prevent Photos from opening automatically when devices are plugged in
echo "Prevent Photos from opening automatically when device is plugged in" $(/Library/Addigy/user-job -user $loggedInUser -run defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true")


