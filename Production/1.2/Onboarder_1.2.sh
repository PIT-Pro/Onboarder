#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom, Jeroen Potters | PIT Pro B.V.
#
# Run script as user
#
# PREREQUISITE: dockutil

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.2/dock.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.2/finder.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.2/menubar.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.2/wallpaper.sh)"

# Refresh Finder & System Preferences
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
