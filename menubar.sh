# Show battery percentage in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Tijd en datum
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist DateFormat -string "$1"
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowSeconds -bool true
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.menuextra.clock.plist ShowDayOfMonth -bool true
# Show Bluetooth in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write /Users/$loggedInUser/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
# Show Time Machine in menubar
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"
# Show Volume in menubar
 /Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.systemuiserver menuExtras -array-add Volume.menu
 # Show VPN in menubar
/Library/Addigy/user-job -user $loggedInUser -run open "/System/Library/CoreServices/Menu Extras/vpn.menu"
# Show VPN connected time in menubar
/Library/Addigy/user-job -user $loggedInUser -run defaults write com.apple.networkConnect VPNShowTime -string "1"