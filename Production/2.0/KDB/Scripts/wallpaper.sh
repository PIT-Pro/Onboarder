#!/bin/bash

#Variables
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

#Functions

setWallpaper(){
FILE=/Users/Shared/wallpaper.png
if [ -f "$FILE" ] ; then
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/wallpaper.png"' /Users/$loggedInUser
else
    echo "$FILE does not exist, check if wallpaper file is present in /Users/Shared/"
fi
}

setWallpaper