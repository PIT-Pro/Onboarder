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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/dock.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/finder.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/menubar.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/wallpaper.sh)"
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.3/profile.sh)" $loggedInUser /User/Shared.profile.png

# Refresh Finder & System Preferences
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer

fi