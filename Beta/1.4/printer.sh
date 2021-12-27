#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.4 by Thomas Boom | PIT Pro B.V.
## PREREQUISITE: dockutil
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

cupsctl WebInterface=yes
/usr/sbin/lpadmin -p Canon iR-ADV C5535 -v 172.16.17.40 -o printer-is-shared=false 
# https://joelsenders.wordpress.com/2021/01/19/using-lpadmin-to-install-printers-in-macos/