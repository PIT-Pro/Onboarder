#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.3 by Thomas Boom, Jeroen Potters | PIT Pro B.V.
#
# Run script as user
#
# PREREQUISITE: dockutil
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

echo "Removing macOS items and adding Office items in Dock"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/dock.sh)"
echo "Tweaking Finder experience"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/finder.sh)"
echo "Adding items to Menubar"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/menubar.sh)"
echo "Changing wallpaper image to /Users/Shared/wallpaper.png"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/wallpaper.sh)"
echo "Changing profile picture to /Users/Shared/profile.png"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/profile.sh)"
echo "Disabling automatic macOS updates"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/softwareupdate.sh)"

# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences"
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
