#!/bin/bash
#
# per user settings for Strangelove Creatives B.V.
#
# 2021.02.3 versie 4.0 by Thomas Boom, Jeroen Potters | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Show battery percentage in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Tijd en datum
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist DateFormat -string "$1"
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowSeconds -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
# Show Bluetooth in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write /Users/$loggedInUser/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# Show Time Machine in menubar
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# Show Volume in menubar
 /Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
 # Show VPN in menubar
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
# Show VPN connected time in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.networkConnect VPNShowTime -string "1"

/usr/local/bin/dockutil --remove "Maps" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Photos" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "FaceTime" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Contacts" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Reminders" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Music" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "TV" /Users/$loggedInUser
/usr/local/bin/dockutil --remove "Podcasts" /Users/$loggedInUser
/usr/local/bin/dockutil --add "/Applications/Google Chrome.app" --before "Safari" /Users/$loggedInUser
/usr/local/bin/dockutil --add "Applications/Microsoft Word"

#Show icons for HDD, servers, removable media
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Always show scrollbars
/Library/Addigy/user-job -user $loggedInUser -run defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Show Path bar in Finder
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.finder _FXShowPosixPathI
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

# Don't show recent applications in Dock
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false

#set wallpaper (needs Desktoppr installed)
#/usr/local/bin/desktoppr "/Library/Desktop Pictures/BoringBlueDesktop.png"


# Refresh Finder & System Preferences
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall systemuiserver
