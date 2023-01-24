#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2023.1.25 version 1.8 by Thomas Boom | PIT Pro B.V.

# Run script as user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
FILE=/Users/Shared/profile.png

#Set profile picture for user
if [ -f "$FILE" ] ; then
dscl . delete /Users/$loggedInUser jpegphoto
dscl . delete /Users/$loggedInUser Picture
dscl . create /Users/$loggedInUser Picture "/Users/Shared/profile.png" 
else 
    echo "$FILE does not exist, check if profile.png is present in /Users/Shared/"
fi
