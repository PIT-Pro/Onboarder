#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.13 version 1.0 by Thomas Boom | PIT Pro B.V.

#check if wallpaper exists, then applies it.
FILE=/Users/Shared/wallpaper.png
if [ -f "$FILE" ]; then
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/wallpaper.png"'
else 
    echo "$FILE does not exist."
fi