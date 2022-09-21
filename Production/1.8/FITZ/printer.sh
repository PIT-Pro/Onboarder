#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.4 by Thomas Boom | PIT Pro B.V.
# Thanks to Joel Senders!
#
# Run script as user
cupsctl WebInterface=yes
lpadmin -p Konica_Minolta_BizHub_C258 -P /Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz -v socket://172.16.192.40 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
cupsctl --no-share-printers