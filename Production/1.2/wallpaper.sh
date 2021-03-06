#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.14 version 1.2 by Thomas Boom | PIT Pro B.V.

# Logged in User in variable
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

#check if wallpaper exists, then applies it.
FILE=/Users/Shared/wallpaper.png
if [ -f "$FILE" ]; then
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/wallpaper.png"' /Users/$loggedInUser
else 
    echo "$FILE does not exist."
fi

#change profile picture of logged in user
FILE=/Users/Shared/profile.png
if [ -f "$FILE" ]; then
dscl . delete /Users/$loggedInUser jpegphoto
dscl . delete /Users/$loggedInUser Picture
dscl . create /Users/$loggedInUser Picture "/Users/Shared/profile.png"
else 
    echo "$FILE does not exist."
fi