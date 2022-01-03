#!/bin/bash
#Thanks Tobias Morrison!
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.3 by Thomas Boom | PIT Pro B.V.
#
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

userjob=/Library/Addigy/user-job
dockutil=/usr/local/bin/dockutil
sleep=/bin/sleep

$dockutil --remove all
$sleep 2
$dockutil --add '/Applications/Safari.app' --no-restart --all-homes
$dockutil --add '/Applications/Notes.app' --no-restart --all-homes
$dockutil --add '/Applications/Launchpad.app' --no-restart --all-homes
$dockutil --add '/Applications/Calendar.app' --no-restart --all-homes
$dockutil --add '/Applications/Google Chrome.app' --no-restart --all-homes
$dockutil --add '/Applications/Microsoft Word.app' --no-restart --all-homes
$dockutil --add '/Applications/System Preferences.app' --no-restart --all-homes
$dockutil --add '~/Downloads' --view grid --display folder --all-homes