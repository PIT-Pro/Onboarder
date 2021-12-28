#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.4 by Thomas Boom | PIT Pro B.V.
# Thanks to Joel Senders!
#
# Run script as user
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

cupsctl WebInterface=yes
/Library/Addigy/user-job -user $loggedInUser -run lpadmin -p Canon_5355i -P /Library/Printers/PPDs/Contents/Resources/CNMCIRAC5535S2.ppd.gz -v socket://172.16.17.40 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
