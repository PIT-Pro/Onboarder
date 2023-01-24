#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.25 version 1.8 by Thomas Boom | PIT Pro B.V.
#
# Run script as user

#Set log file variable
LOGFILE=/Users/Shared/onboarder_log.txt

#Output to logfile if exists, else create file
if [ -e $LOGFILE ]
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE

echo "Tweaking Finder experience.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/STRG/finder.sh)" | tee -a $LOGFILE

echo "Adding items to Menubar.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/STRG/menubar.sh)" | tee -a $LOGFILE

echo "Changing profile picture to /Users/Shared/profile.png.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/STRG/profile.sh)" | tee -a $LOGFILE

echo "Setting wallpaper.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/STRG/wallpaper.sh)" | tee -a $LOGFILE

echo "Configuring dock.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.8/STRG/dock.sh)" | tee -a $LOGFILE


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
killall ControlCenter  | tee -a $LOGFILE
killall Finder  | tee -a $LOGFILE
killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0