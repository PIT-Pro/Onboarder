#!/bin/bash

echo ".ppd will probably be deprecated in macOS 14"
cupsctl WebInterface=yes
lpadmin -p Kyocera_C2552ci -P "/Library/Printers/PPDs/Contents/Resources/Kyocera TASKalfa 2551ci.PPD" -v socket://192.168.10.3 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E
cupsctl --no-share-printers