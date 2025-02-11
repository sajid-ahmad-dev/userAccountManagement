#!/bin/bash

## Account Creation

echo "Provide your Username"
read user
echo "Provide your Password"
read password


# Count the number of lines in /etc/passwd

noOfLines=$(wc -l /etc/passwd | awk '{print $1}')

# Get the last $noOfLines users from /etc/passwd

existing_user=$(tail -n $noOfLines /etc/passwd | awk -F: '{print $1}' | tr '\n' ' ')

# Check if the user already exists

if [[ " $existing_user " == *" $user "* ]]; then
    echo "userName Exist"
    exit 1
else
    # Create the user
    sudo useradd $user -m
    # Set the password
    echo "$user:$password" | sudo chpasswd
    echo "User is created"
fi
