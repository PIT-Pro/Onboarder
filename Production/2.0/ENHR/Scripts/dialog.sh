#!/bin/bash

#Variables
dialog=/usr/local/bin/dialog

runDialog(){
$dialog --title "Onboarder 2.0 - EN HR solutions" --titlefont "size=20" --icon "https://raw.githubusercontent.com/PIT-Pro/Onderhoud-Pro/main/Files/logo.png" --overlayicon -d caution --ontop --small --infobox "PIT Pro B.V. \n - Je kunt ons bereiken via: support@pitpro.nl \n - Of voor spoed: 020-2611450" --messagefont "size=14" --message "Deze app stelt de interface van macOS opnieuw in. Van de volgende applicaties worden instellingen gewijzigd/toegepast: \n - Dock \n - Finder  \n - Menubar \n - Printer \n - Achtergrond \n - Wifi"
}

runDialog