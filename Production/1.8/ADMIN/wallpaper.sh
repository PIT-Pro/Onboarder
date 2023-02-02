#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.24 version 1.8 by Thomas Boom | PIT Pro B.V.
#

# Run script as user
userjob="/Library/Addigy/user-job"

#disable screensaver
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime 0

#Download 'macos-wallpaper' from GitHub
/bin/bash -c "$(curl -fsSL https://github.com/sindresorhus/macos-wallpaper/releases/download/v2.3.1/wallpaper.zip -o /Library/Addigy/PIT\ Pro/wallpaper.zip)" | tee -a $LOGFILE

#Unzip to folder
unzip /Library/Addigy/PIT\ Pro/wallpaper.zip -d /Library/Addigy/PIT\ Pro | tee -a $LOGFILE

#set wallpaper to solid red
$userjob -user localadmin -run /Library/Addigy/PIT\ Pro/wallpaper set-solid-color C91D22 | tee -a $LOGFILE

#delete zipfile and 'macos-wallpaper'
sleep 5
rm -rf "/Library/Addigy/PIT Pro/wallpaper.zip"
rm -rf "/Library/Addigy/PIT Pro/wallpaper"