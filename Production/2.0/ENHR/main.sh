#!/bin/bash

#Variables
LOGFILE="/Library/Addigy/PIT Pro/onboarder_log.txt"

#Functions
checkLog(){
    if [ -e "$LOGFILE" ];
then
    echo "onboarder_log.txt exists, writing output to file.."
else
    echo "onboarder_log.txt does not exist, creating file.."
    touch "/Library/Addigy/PIT Pro/onboarder_log.txt"
fi
}

writeLog(){
exec > >(tee "$LOGFILE") 2>&1
echo "==> $(date "+%Y-%m-%d %H:%M:%S")"
}

#Installs swiftDialog if not found
dialogCheck(){
  # Get the URL of the latest PKG From the Dialog GitHub repo
  dialogURL=$(curl --silent --fail "https://api.github.com/repos/bartreardon/swiftDialog/releases/latest" | awk -F '"' "/browser_download_url/ && /pkg\"/ { print \$4; exit }")
  # Expected Team ID of the downloaded PKG
  expectedDialogTeamID="PWA5E9TQ59"

  # Check for swiftDialog and install if not found
  if [ ! -e "/Library/Application Support/Dialog/Dialog.app" ]; then
    echo "Dialog not found. Installing..."
    # Create temporary working directory
    workDirectory=$( /usr/bin/basename "$0" )
    tempDirectory=$( /usr/bin/mktemp -d "/private/tmp/$workDirectory.XXXXXX" )
    # Download the installer package
    /usr/bin/curl --location --silent "$dialogURL" -o "$tempDirectory/Dialog.pkg"
    # Verify the download
    teamID=$(/usr/sbin/spctl -a -vv -t install "$tempDirectory/Dialog.pkg" 2>&1 | awk '/origin=/ {print $NF }' | tr -d '()')
    # Install the package if Team ID validates
    if [ "$expectedDialogTeamID" = "$teamID" ] || [ "$expectedDialogTeamID" = "" ]; then
      /usr/sbin/installer -pkg "$tempDirectory/Dialog.pkg" -target /
      echo "swiftDialog Team ID verification failed."
      exit 1
    fi
    # Remove the temporary working directory when done
    /bin/rm -Rf "$tempDirectory"  
  else echo "swiftDialog found. Proceeding..."
  fi
}

#Installs dockUtil if not found
dockutilCheck(){
  # Get the URL of the latest PKG From the Dialog GitHub repo
  dialogURL=$(curl --silent --fail "https://api.github.com/repos/kcrawford/dockutil/releases/latest" | awk -F '"' "/browser_download_url/ && /pkg\"/ { print \$4; exit }")
  # Expected Team ID of the downloaded PKG
  expectedDialogTeamID="Z5J8CJBUWC"

  # Check for dockUtil and install if not found
  if [ ! -e "/usr/local/bin/dockutil" ]; then
    echo "dockUtil not found. Installing..."
    # Create temporary working directory
    workDirectory=$( /usr/bin/basename "$0" )
    tempDirectory=$( /usr/bin/mktemp -d "/private/tmp/$workDirectory.XXXXXX" )
    # Download the installer package
    /usr/bin/curl --location --silent "$dialogURL" -o "$tempDirectory/dockUtil.pkg"
    # Verify the download
    teamID=$(/usr/sbin/spctl -a -vv -t install "$tempDirectory/dockUtil.pkg" 2>&1 | awk '/origin=/ {print $NF }' | tr -d '()')
    # Install the package if Team ID validates
    if [ "$expectedDialogTeamID" = "$teamID" ] || [ "$expectedDialogTeamID" = "" ]; then
      /usr/sbin/installer -pkg "$tempDirectory/Dialog.pkg" -target /
      echo "dockUtil Team ID verification failed."
      exit 1
    fi
    # Remove the temporary working directory when done
    /bin/rm -Rf "$tempDirectory"  
  else echo "dockUtil found. Proceeding..."
  fi
}

runDialog(){
    echo "Running Dialog.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/dialog.sh)"
}

runFinder(){
    echo "Tweaking Finder experience.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/finder.sh)"
}

runMenubar(){
    echo "Adding items to Menubar.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/menubar.sh)"
}

runWallpaper(){
    echo "Changing wallpaper image to /Users/Shared/wallpaper.png.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/wallpaper.sh)"
}

installPrinter(){
    echo "Installing Canon Printer.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/printer.sh)"
}

runDock(){
echo "Configuring dock.."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/dock.sh)"
}

runWifi(){
echo "Allowing standard users to change Wifi settings.."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/wifi.sh)"
}

runDialog2(){
    echo "Finishing.."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/PIT-Pro/Onboarder/main/Production/2.0/ENHR/Scripts/dialog2.sh)"
}

echo "Running Script.."

#Run functions
checkLog
writeLog
dialogCheck
runDialog
dockutilCheck
runFinder
runMenubar
runWallpaper
installPrinter
runDock
runWifi
runDialog2

exit 0