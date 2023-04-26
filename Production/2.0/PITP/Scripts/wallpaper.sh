#!/bin/bash

#Variables
userjob="/Library/Addigy/user-job"

#Functions
Disable_Install_Remove(){
sudo defaults write /Library/Preferences/com.apple.screensaver loginWindowIdleTime 0
/bin/bash -c "$(curl -fsSL https://github.com/sindresorhus/macos-wallpaper/releases/download/v2.3.1/wallpaper.zip -o /Library/Addigy/PIT\ Pro/wallpaper.zip)" | tee -a $LOGFILE
unzip /Library/Addigy/PIT\ Pro/wallpaper.zip -d /Library/Addigy/PIT\ Pro | tee -a $LOGFILE
$userjob -user localadmin -run /Library/Addigy/PIT\ Pro/wallpaper set-solid-color C91D22 | tee -a $LOGFILE
rm -rf "/Library/Addigy/PIT Pro/wallpaper.zip"
rm -rf "/Library/Addigy/PIT Pro/wallpaper"
}

Disable_Install_Remove