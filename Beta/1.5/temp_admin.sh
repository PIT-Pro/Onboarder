loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

userjob=/Library/Addigy/user-job
# Create temporary admin user
$userjob dscl . -create /Users/securetoken
$userjob dscl . -create /Users/securetoken UserShell /bin/bash
$userjob dscl . -create /Users/securetoken RealName "Secure Token"
$userjob dscl . -create /Users/securetoken UniqueID 1010”
$userjob dscl . -create /Users/securetoken PrimaryGroupID 1000”
$userjob dscl . -passwd /Users/securetoken tokenpassword
$userjob dscl . -create /Users/securetoken NFSHomeDirectory /Local/Users/securetoken
$userjob dscl . -append /Groups/admin GroupMembership securetoken
