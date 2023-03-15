#!/bin/bash

echo ".ppd will probably be deprecated in macOS 14"
cupsctl WebInterface=yes
lpadmin -p Konica_Minolta_BizHub_C258 -P /Library/Printers/PPDs/Contents/Resources/KONICAMINOLTAC258.gz -v socket://172.16.192.40 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
cupsctl --no-share-printers