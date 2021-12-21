#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`


FILE=/Users/Shared/profile.png
if [ -f "$FILE" ] ; then
dscl . delete /Users/$loggedInUser jpegphoto
dscl . delete /Users/$loggedInUser Picture
dscl . create /Users/$loggedInUser Picture "/Users/Shared/profile.png" 
else 
    echo "$FILE does not exist, check if wallpaper file is present in /Users/Shared/"
fi
