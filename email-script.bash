#!/bin/bash

# Name: Devin Iverson
# Date: 12/10/22
# Purpose: If someone logins into Bob's Data Analytics Server with SSH during off hours (11pm to 6am), an email is sent to blueteamDCJ@yahoo.com  

# File added to /usr/local/bin directory of Bob's Data Analytics Server

# email variables
sender="alertDCJ@yahoo.com"
recepient="blueteamDCJ@yahoo.com"
# Current time to check if login is during off hours
currenttime=$(date +%H:%M)

if [[ "$PAM_TYPE" != "close_session" ]] || [[ "$currenttime" > "22:00" ]] || [[ "$currenttime" < "06:00 " ]]; then
    host="'hostname'"
    subject="SSH Login: $PAM_USER from $PAM_RHOST on $host"
    message="'env'"
    mailx -r "$sender" -s "$subject" "$recepient"
fi

