#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.24 version 1.8 by Thomas Boom | PIT Pro B.V.

LOGFILE=/Users/Shared/onboarder_log.txt

if [ -e $LOGFILE ]
then
    echo "onboarder_admin_log.txt exists, writing output to file.."
else
    echo "onboarder_admin_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE

sleep 5

echo "Tweaking Finder experience.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/ADMIN/finder.sh)" | tee -a $LOGFILE

echo "Adding items to Menubar.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/ADMIN/menubar.sh)" | tee -a $LOGFILE

echo "Changing wallpaper image to Solid Red and disabling screensaver.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/ADMIN/wallpaper.sh)" | tee -a $LOGFILE

echo "Configuring dock.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/ADMIN/dock.sh)" | tee -a $LOGFILE


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
killall ControlCenter  | tee -a $LOGFILE
killall Finder  | tee -a $LOGFILE
killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0