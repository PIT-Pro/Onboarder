#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
# Run script as user
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

#check if wallpaper exists, then applies it.
FILE=/Library/Desktop Pictures/Solid Colors/Solid Red.png
if [ -f "$FILE" ] ; then
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Library/Desktop Pictures/Solid Colors/Solid Red.png"' /Users/$loggedInUser
else
    echo "$FILE does not exist, check if wallpaper file is present in /Users/Shared/"
fi
