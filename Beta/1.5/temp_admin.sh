#!/bin/bash
loggedInUser=`python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");'`
userjob=/Library/Addigy/user-job
# Create temporary admin -user
#. /etc/rc.common
dscl . create /Users/securetoken
dscl . create /Users/securetoken RealName "SecureToken Account"
dscl . passwd /Users/securetoken tokenpassword
dscl . create /Users/securetoken UniqueID 510
dscl . create /Users/securetoken PrimaryGroupID 80
dscl . create /Users/securetoken UserShell /bin/bash
dscl . append /Groups/admin GroupMembership securetoken
dscl . create /Users/securetoken NFSHomeDirectory /Users/securetoken
cp -R /System/Library/User\ Template/English.lproj /Users/securetoken
echo "administrator account 'securetoken' created"