SECURE_TOKEN_USER="securetoken"
SECURE_TOKEN_USER_PASS="tokenpassword"
NEW_SECURE_TOKEN_USER="localadmin"
NEW_SECURE_TOKEN_USER_PASS="ebFr4mCc"

# Give local admin user secure token using admin user credentials established as part of Setup Assistant
/usr/sbin/sysadminctl -adminUser "$SECURE_TOKEN_USER" -adminPassword "$SECURE_TOKEN_USER_PASS" -secureTokenOn "$NEW_SECURE_TOKEN_USER" -password "$NEW_SECURE_TOKEN_USER_PASS"
exitresult=$(/bin/echo $?)

if [ "$exitresult" = 0 ]; then
    /bin/echo "Successfully added secure Token to ${NEW_SECURE_TOKEN_USER}!"
    # With token successfully added to local admin, delete temp DEP admin user
    /bin/echo "Deleting temp ${SECURE_TOKEN_USER} DEP admin user ..."
    
    exitcode=0
else
    /bin/echo "Failed to add secure Token to ${NEW_SECURE_TOKEN_USER}."
    exitcode=1
fi

#delete temporary user
dscl . -delete /Groups/admin GroupMembership securetoken
dscl . -delete "/Users/securetoken"

exit $exitcode