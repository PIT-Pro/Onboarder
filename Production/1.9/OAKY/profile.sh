#!/bin/bash

# Run script as user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

#If script is run as non-admin user, add sudo before every dscl command
FILE=/Users/Shared/profile.png
if [ -f "$FILE" ] ; then
dscl . delete /Users/$loggedInUser jpegphoto
dscl . delete /Users/$loggedInUser Picture
dscl . create /Users/$loggedInUser Picture "/Users/Shared/profile.png" 
else 
    echo "$FILE does not exist, check if wallpaper file is present in /Users/Shared/"
fi
