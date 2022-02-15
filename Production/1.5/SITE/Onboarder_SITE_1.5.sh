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
LOGFILE=/Users/Shared/onboarder_log.txt

if [ -e $LOGFILE ]
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE
echo "Removing macOS items and adding Office items in Dock" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/dock.sh)" | tee -a $LOGFILE
echo "Tweaking Finder experience" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/finder.sh)" | tee -a $LOGFILE
echo "Adding items to Menubar" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/menubar.sh)" | tee -a $LOGFILE
echo "Changing wallpaper image to /Users/Shared/wallpaper.png" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/wallpaper.sh)" | tee -a $LOGFILE
echo "Changing profile picture to /Users/Shared/profile.png" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/profile.sh)" | tee -a $LOGFILE
echo "Disabling automatic macOS updates" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/softwareupdate.sh)" | tee -a $LOGFILE
echo "Installing Canon Printer" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/printer.sh)" | tee -a $LOGFILE
echo "Creating temporary admin user" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/temp_admin.sh)" | tee -a $LOGFILE
echo "Enabling SecureToken for Localadmin and removing temporary admin user" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Beta/1.5/securetoken.sh)" | tee -a $LOGFILE


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
$userjob -user $loggedInUser -run killall ControlCenter  | tee -a $LOGFILE
$userjob -user $loggedInUser -run killall Finder  | tee -a $LOGFILE
$userjob -user $loggedInUser -run killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0