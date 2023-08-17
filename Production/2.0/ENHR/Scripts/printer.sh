#!/bin/bash

#Functions
installPrinter(){
echo ".ppd will probably be deprecated in macOS 14"
cupsctl WebInterface=yes
lpadmin -p Canon_5355i -P /Library/Printers/PPDs/Contents/Resources/CNMCIRAC5535S2.ppd.gz -v socket://10.17.10.5 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
cupsctl --no-share-printers
}

installPrinter