#!/bin/bash

#Functions

setWifi(){
/usr/bin/security authorizationdb write system.preferences.network allow
/usr/bin/security authorizationdb write system.services.systemconfiguration.network allow
/usr/bin/security authorizationdb write com.apple.wifi allow
networksetup -addpreferredwirelessnetworkatindex en0 "EN HR solutions" 0 WPA2E
networksetup -addpreferredwirelessnetworkatindex en0 "EN Guest" 1 WPA2
}

setWifi