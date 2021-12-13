#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom, Jeroen Potters | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

curl -s https://github.com/PIT-Pro/Onboarding/blob/main/Production/dock.sh | bash
curl -s https://github.com/PIT-Pro/Onboarding/blob/main/Production/finder.sh | bash
curl -s https://github.com/PIT-Pro/Onboarding/blob/main/Production/menubar.sh | bash

# Refresh Finder & System Preferences
/Library/Addigy/user-job -user $loggedInUser -run killall ControlCenter
/Library/Addigy/user-job -user $loggedInUser -run killall Finder
/Library/Addigy/user-job -user $loggedInUser -run killall SystemUIServer
