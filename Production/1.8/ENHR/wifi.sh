#Allow standard user to remove SSID's from Wifi settings
/usr/bin/security authorizationdb write system.preferences.network allow
/usr/bin/security authorizationdb write system.services.systemconfiguration.network allow
/usr/bin/security authorizationdb write com.apple.wifi allow

#add preferred networks in order
networksetup -addpreferredwirelessnetworkatindex en0 "EN HR solutions" 0 WPA2E
networksetup -addpreferredwirelessnetworkatindex en0 "EN Guest" 1 WPA2