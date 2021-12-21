#!/bin/bash
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

echo "PROFILE PICTURE SCRIPT RUNNING"

FILE=/Users/Shared/profile.png
if [ -f "$FILE" ] ; then
dscl . delete /Users/$loggedInUser jpegphoto
dscl . delete /Users/$loggedInUser Picture
dscl . create /Users/$loggedInUser Picture "/Users/Shared/profile.png" 
else 
    echo "$FILE does not exist, check if wallpaper file is present in /Users/Shared/"
fi
