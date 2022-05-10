#!/bin/bash
#Thanks Tobias Morrison!
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.6 by Thomas Boom | PIT Pro B.V.
userjob=/Library/Addigy/user-job
sleep=/bin/sleep
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
 
 #remove all dock icons first
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --remove all --no restart

#replace dock icons (dockutil moet geinstalleerd zijn/in policy staan)
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add '/System/Applications/Launchpad.app' --no-restart
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Google Chrome.app" --no-restart
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add '/Applications/Safari.app' --no-restart
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add '/System/Applications/System Preferences.app' --no-restart
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add '/Applications/Calendar.app' --no-restart
$userjob -user $loggedInUser -run /usr/local/bin/dockutil --add '/Applications/FaceTime.app' --no-restart

if pgrep -u $loggedInUser Microsoft Word > /dev/null
then
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Microsoft Word.app" 
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Microsoft Outlook.app" 
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Microsoft Excel.app" 
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Microsoft Powerpoint.app"
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/Microsoft Teams.app" 
else
    echo "Office not installed"
fi

if pgrep -u $loggedInUser WhatsApp > /dev/null
then
    $userjob -user $loggedInUser -run /usr/local/bin/dockutil --add "/Applications/WhatsApp.app" 
else
    echo "WhatsApp not installed"
fi

# Don't show recent applications in Dock
$userjob -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false 
exit
