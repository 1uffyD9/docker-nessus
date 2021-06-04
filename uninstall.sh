#!/bin/bash

# Colors
C=$(echo -e '\033') # 27 = 033 = 0x1b = ^[ = \e
Y="${C}[33m"
NC="${C}[0m"
GREEN="${C}[32m"
R="${C}[31m"

if [ "$EUID" -ne 0 ]
then
        echo -e "$R[!] Please run as root!"
        exit
fi

echo -e "$Y[*] Removing Nessus...$NC"
sudo docker stop nessus_runner & sudo docker rm nessus_runner & sudo docker rmi nessus:v1
echo -e "$GREEN[*] Done!$NC"

