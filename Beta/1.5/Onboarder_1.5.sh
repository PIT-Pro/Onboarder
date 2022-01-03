#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
## PREREQUISITE: dockutil, canon printer driver
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

userjob=/Library/Addigy/user-job

echo "Removing macOS items and adding Office items in Dock"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/dock.sh)" 1> /dev/null
echo "Tweaking Finder experience"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/finder.sh)" 1> /dev/null
echo "Adding items to Menubar"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/menubar.sh)" 1> /dev/null
echo "Changing wallpaper image to /Users/Shared/wallpaper.png"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/wallpaper.sh)" 1> /dev/null
echo "Changing profile picture to /Users/Shared/profile.png"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/profile.sh)" 1> /dev/null
echo "Disabling automatic macOS updates"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/ENHR/softwareupdate.sh)" 1> /dev/null
echo "Installing Canon Printer"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/printer.sh)" 1> /dev/null


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences"
$userjob -user $loggedInUser -run killall ControlCenter 1> /dev/null
$userjob -user $loggedInUser -run killall Finder 1> /dev/null
$userjob -user $loggedInUser -run killall SystemUIServer 1> /dev/null
echo "Done!"
exit 0