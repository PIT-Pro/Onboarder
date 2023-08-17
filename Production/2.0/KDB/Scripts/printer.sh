#!/bin/bash

#Office Printers
#HP OfficeJet Pro 8210
#HP LaserJet MFP M426fdw
#HP LaserJet Pro M428-429

#Functions
installPrinter1(){
    echo ".ppd will probably be deprecated in macOS 14"
    echo "Installing HP OfficeJet Pro 8210.."
    cupsctl WebInterface=yes
    lpadmin -p KDB-1 -P "/Library/Printers/PPDs/Contents/Resources/HP OfficeJet Pro 8210.ppd.gz" -v socket://172.16.9.236 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
    cupsctl --no-share-printers
}

installPrinter2(){
    echo "Installing HP LaserJet MFP M426fdw.."
    lpadmin -p KDB-2 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet Pro MFP M426f-M427f Fax.ppd.gz" -v socket://172.16.9.157 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
    cupsctl --no-share-printers
}

installPrinter3(){
    echo "Installing HP LaserJet Pro M428-429.."
    lpadmin -p KDB-3 -P "/Library/Printers/PPDs/Contents/Resources/HP LaserJet Pro M428-M429.ppd.gz" -v socket://172.16.9.51 -o CNDuplex=DuplexFront -o CNColorMode=mono -o ColorModel=Gray -E 
    cupsctl --no-share-printers
}

installPrinter1
installPrinter2
installPrinter3