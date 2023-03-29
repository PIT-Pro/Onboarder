#!/bin/bash

#Variables
userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )
OSbuild=$(sw_vers -ProductVersion)

#Functions
remove_items(){
    #remove all items from Dock
    $userjob --user "$loggedInUser" -run $dockutil --remove all /Users/"$loggedInUser"
    killall Dock
}   

Check_macOS_for_Build(){
if [[ $OSbuild = 13.* ]] ; then
    echo "Running Ventura.."
    $userjob -user "$loggedInUser" -run $dockutil --add "/System/Applications/System Settings.app" --no-restart /Users/"$loggedInUser"
else
    echo "Running Monterey.."
    $userjob -user "$loggedInUser" -run $dockutil --add "/System/Applications/System Preferences.app" --no-restart /Users/"$loggedInUser"
fi
}

Check_Chrome(){
if [ -d "/Applications/Google Chrome.app" ]; then
     $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Google Chrome.app" --no-restart /Users/"$loggedInUser"
else
    echo "Google Chrome not installed"
fi
}

Check_365(){
    if [ -d "/Applications/Microsoft Word.app" ]; then

    $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Microsoft Word.app" --no-restart /Users/"$loggedInUser"
    $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Microsoft Outlook.app" --no-restart /Users/"$loggedInUser"
    $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Microsoft Excel.app" --no-restart /Users/"$loggedInUser"
    $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Microsoft Powerpoint.app" --no-restart /Users/"$loggedInUser"

else
    echo "Office not installed"
fi
}

Check_Teams(){
    if [ -d "/Applications/Microsoft Teams.app" ]; then
    $userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Microsoft Teams.app" --no-restart /Users/"$loggedInUser"
else
    echo "Microsoft Teams not installed"
fi
}

Add_Apps(){
$userjob -user "$loggedInUser" -run $dockutil --add "/System/Applications/Launchpad.app" --no-restart /Users/"$loggedInUser"
$userjob -user "$loggedInUser" -run $dockutil --add "/Applications/Safari.app" --no-restart /Users/"$loggedInUser"
$userjob -user "$loggedInUser" -run $dockutil --add "/System/Applications/Calendar.app" --no-restart /Users/"$loggedInUser"
$userjob -user "$loggedInUser" -run $dockutil --add "/System/Applications/FaceTime.app" --no-restart /Users/"$loggedInUser"
}

remove_items
Check_macOS_for_Build
Check_Chrome
Check_365
Check_Teams
Add_Apps