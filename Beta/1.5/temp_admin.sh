loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`

# Create temporary admin user
dscl . -create /Users/securetoken
dscl . -create /Users/securetoken UserShell /bin/bash
dscl . -create /Users/securetoken RealName "Secure Token"
dscl . -create /Users/securetoken UniqueID 1010”
dscl . -create /Users/securetoken PrimaryGroupID 1000”
dscl . -passwd /Users/securetoken tokenpassword
dscl . -create /Users/securetoken NFSHomeDirectory /Local/Users/securetoken
dscl . -append /Groups/admin GroupMembership securetoken
