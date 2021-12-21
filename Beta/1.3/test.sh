#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.2 by Thomas Boom | PIT Pro B.V.

# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
echo "Disabled recent applications in dock" $(/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false)

