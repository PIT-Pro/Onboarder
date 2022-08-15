#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
## PREREQUISITE: dockutil, 
#
# Run script as user

userjob=/Library/Addigy/user-job
LOGFILE=/Users/Shared/onboarder_log.txt

if [ -e $LOGFILE ]
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE
echo "Tweaking Finder experience" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.7/SITE/finder.sh)" | tee -a $LOGFILE
echo "Adding items to Menubar" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.7/SITE/menubar.sh)" | tee -a $LOGFILE
echo "Changing wallpaper image to /Users/Shared/wallpaper.png" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.7/SITE/wallpaper.sh)" | tee -a $LOGFILE
echo "Changing profile picture to /Users/Shared/profile.png" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.7/SITE/profile.sh)" | tee -a $LOGFILE
echo "Installing Kyocera Printer" | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.7/SITE/printer.sh)" | tee -a $LOGFILE



# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
killall ControlCenter  | tee -a $LOGFILE
killall Finder  | tee -a $LOGFILE
killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0