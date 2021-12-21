#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.3 by Thomas Boom, Jeroen Potters | PIT Pro B.V.
#
# Run script as user
#
# PREREQUISITE: dockutil

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/dock.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/finder.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/menubar.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/wallpaper.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/profile.sh $loggedInUser /Users/Shared/profile.jpg)"

# Refresh Finder & System Preferences
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer