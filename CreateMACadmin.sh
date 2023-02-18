#!/bin/bash

#small script to create admin user on MAC OSX
#first run this command to encrypt your password
# echo "PASSWORD" | openssl enc -aes-256-cbc -a -salt -pass pass:secret -pbkdf2
# Save the results to a file called password.txt

# Here is the script
# Set variables for the new user account
USERNAME="newuser"
FULLNAME="New User"
ENCRYPTED_PASSWORD=$(cat password.txt)
PASSWORD=$(echo "$ENCRYPTED_PASSWORD" | openssl enc -d -aes-256-cbc -a -pass pass:secret -pbkdf2)

# Use sysadminctl to create the user account with admin privileges
sysadminctl -addUser $USERNAME -fullName "$FULLNAME" -password "$PASSWORD" -admin

# Verify that the user account was created
dscl . -read /Users/$USERNAME

# Optional: Set the user's shell to bash
dscl . -create /Users/$USERNAME UserShell /bin/bash
