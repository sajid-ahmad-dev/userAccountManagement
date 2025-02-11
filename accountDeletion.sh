#!/bin/bash

## Account Deletion 

echo "Provide the Username"
read user


numberOflines=$(wc -l /etc/passwd | awk '{print $1}')

existing_user=$(tail -n $numberOflines /etc/passwd | awk -F: '{print $1}' | tr '/n' ' ')

if [[ "$existing_user" == *"$user"* ]];then
	sudo userdel -r $user
	echo "User deleted successfully"
else
	echo "User does not exist"
fi

