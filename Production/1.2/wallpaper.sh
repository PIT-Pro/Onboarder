#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom | PIT Pro B.V.

#stopt logged in user in variabele
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#installeer achtergrond die al geupload is naar /User/x/Shared
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/wallpaper.png"'
