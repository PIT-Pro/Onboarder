#!/bin/bash

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
 
 #remove all dock icons first

defaults write com.apple.dock persistent-apps -array
killall Dock

sleep 5

#empty dock

$userjob -user $loggedInUser -run $dockutil --remove all --no-restart

#replace dock icons ($dockutil moet geinstalleerd zijn/in policy staan)
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/Launchpad.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/Applications/Safari.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/System Preferences.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/Calendar.app" --no-restart /Users/$loggedInUser
$userjob -user $loggedInUser -run $dockutil --add "/System/Applications/FaceTime.app" --no-restart /Users/$loggedInUser

if [ -d "/Applications/Microsoft Word.app" ]; then

    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Microsoft Word.app" --no-restart /Users/$loggedInUser
    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Microsoft Outlook.app" --no-restart /Users/$loggedInUser
    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Microsoft Excel.app" --no-restart /Users/$loggedInUser
    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Microsoft Powerpoint.app" --no-restart /Users/$loggedInUser
    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Microsoft Teams.app" --no-restart /Users/$loggedInUser

else
    echo "Office not installed"
fi

if [ -d "/Applications/Whatsapp.app" ]; then

    $userjob -user $loggedInUser -run $dockutil --add "/Applications/WhatsApp.app" /Users/$loggedInUser

else
    echo "WhatsApp not installed"
fi

if [ -d "/Applications/Google Chrome.app" ]; then

    $userjob -user $loggedInUser -run $dockutil --add "/Applications/Google Chrome.app" --no-restart /Users/$loggedInUser
else
    echo "Google Chrome not installed"
fi


# Don't show recent applications in Dock
$userjob -user $loggedInUser -run defaults write com.apple.dock show-recents -bool false 

killall -KILL Dock
exit 0








