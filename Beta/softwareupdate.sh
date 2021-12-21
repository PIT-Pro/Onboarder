#!/bin/bash
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

/Library/Addigy/user-job -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool false
/Library/Addigy/user-job -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool false
/Library/Addigy/user-job -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool false
/Library/Addigy/user-job -user $loggedInUser -run defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool false