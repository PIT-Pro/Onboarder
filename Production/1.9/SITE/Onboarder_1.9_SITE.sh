#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.3.15 version 1.9 by Thomas Boom | PIT Pro B.V.

LOGFILE=/Users/Shared/onboarder_log.txt

check_log(){
    if [ -e "$LOGFILE" ];
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
    touch "/Library/Addigy/PIT Pro/Onboarder_log.txt"
fi
}

writeLog(){
exec > >(tee "$LOGFILE") 2>&1
echo "==> $(date "+%Y-%m-%d %H:%M:%S")"
}

check_log
writeLog
echo "START OF SCRIPT" | tee -a $LOGFILE

echo "Tweaking Finder experience.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/finder.sh)" | tee -a $LOGFILE

echo "Adding items to Menubar.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/menubar.sh)" | tee -a $LOGFILE

echo "Changing wallpaper image to /Users/Shared/wallpaper.png.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/wallpaper.sh)" | tee -a $LOGFILE

echo "Changing profile picture to /Users/Shared/profile.png.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/profile.sh)" | tee -a $LOGFILE

echo "Installing Canon Printer.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/printer.sh)" | tee -a $LOGFILE

echo "Configuring dock.." | tee -a $LOGFILE
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/1.9/SITE/dock.sh)" | tee -a $LOGFILE


# Refresh Finder & System Preferences
echo "Refreshing Finder and System Preferences" | tee -a $LOGFILE
killall ControlCenter  | tee -a $LOGFILE
killall Finder  | tee -a $LOGFILE
killall SystemUIServer  | tee -a $LOGFILE
echo "Done!" | tee -a $LOGFILE
exit 0