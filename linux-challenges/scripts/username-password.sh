#!/bin/sh

read -p 'username: ' username
read -p 'password: ' password
file="/tmp/username-password.txt"

echo "$username $password" > $file
echo "Your username: $username and password $password are in this file $file"