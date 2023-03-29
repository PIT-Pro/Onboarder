#!/bin/bash

#Variables
dialog=/usr/local/bin/dialog

runDialog(){
$dialog --title "Werkplek Pro" --titlefont "size=20" -d --icon "https://raw.githubusercontent.com/PIT-Pro/Onderhoud-Pro/main/Files/logo.png" --overlayicon caution --ontop --small --height 400 --infobox "PIT Pro B.V. \n - Je kunt ons bereiken via: support@pitpro.nl \n - Of voor spoed: 020-2611450" --messagefont "size=14" --message "Werkplek Pro is klaar met de werkzaamheden. Vergeet niet je Mac te herstarten om de wijzigingen succesvol door te voeren."
}

runDialog