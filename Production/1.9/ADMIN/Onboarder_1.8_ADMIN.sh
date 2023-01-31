#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.24 version 1.8 by Thomas Boom | PIT Pro B.V.

loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
LOGFILE=/Library/Addigy/PIT\ Pro/onboarder_admin_log.txt
OSbuild=$(sw_vers -ProductVersion)

# global check if there is a user logged in
if [ -z "$loggedInUser" -o "$loggedInUser" = "loginwindow" ]; then
  echo "no user logged in, cannot proceed"
  exit 1
fi

if [ -e $LOGFILE ]
then
    echo "onboarder_admin_log.txt exists, writing output to file.."
else
    echo "onboarder_admin_log.txt does not exist, creating file.."
fi

echo "START OF SCRIPT" | tee -a $LOGFILE
echo "Mac is running $OSbuild"

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