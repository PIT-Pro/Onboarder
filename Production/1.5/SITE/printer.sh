#!/bin/bash
#
# per user settings for PIT Pro clients
#
# 2021.12.21 version 1.4 by Thomas Boom | PIT Pro B.V.
# Thanks to Joel Senders!
#
# Run script as user
cupsctl WebInterface=yes
lpadmin -p Kyocera_C2552ci -P "/Library/Printers/PPDs/Contents/Resources/Kyocera TASKalfa 2551ci.PPD" -v socket://192.168.10.3 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E
