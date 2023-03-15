#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.3.15 version 1.9 by Thomas Boom | PIT Pro B.V.

LOGFILE=/Users/Shared/onboarder_log.txt

if [ -e $LOGFILE ]
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE

echo "Tweaking Finder experience.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/OAKY/finder.sh)" | tee -a $LOGFILE

echo "Adding items to Menubar.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/OAKY/menubar.sh)" | tee -a $LOGFILE

#echo "Changing wallpaper image to /Users/Shared/wallpaper.png.." | tee -a $LOGFILE
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/OAKY/wallpaper.sh)" | tee -a $LOGFILE

echo "Changing profile picture to /Users/Shared/profile.png.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/OAKY/profile.sh)" | tee -a $LOGFILE

echo "Configuring dock.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/OAKY/dock.sh)" | tee -a $LOGFILE


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
killall ControlCenter  | tee -a $LOGFILE
killall Finder  | tee -a $LOGFILE
killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0