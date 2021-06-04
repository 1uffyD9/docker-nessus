#!/bin/bash

# Colors
C=$(echo -e '\033') # 27 = 033 = 0x1b = ^[ = \e
Y="${C}[33m"
NC="${C}[0m"
GREEN="${C}[32m"
R="${C}[31m"

PORT=49562	# Assign a custom port here
IP=$(ifconfig | grep 'eth0\|ens33' -A1 | grep "inet " | awk -F' ' '{print $2}')	# change the interface if you're using a different interface other than eth0

if [ "$EUID" -ne 0 ]
then
	echo -e "$R[!] Please run as root!"
	exit
fi
	
echo -e "$Y[*] Creating docker image...$NC"
sudo docker build -t nessus:v1 .
echo -e "$Y[*] Creating nessus container..$NC"
sudo docker run -dti --name nessus_runner -p $PORT:8834 nessus:v1 bash
echo -e "$Y[*] Starting Nessus...$NC"
sudo docker exec nessus_runner bash -c "/etc/init.d/nessusd start"
echo -e "$GREEN[*] Started nessus docker on https://$IP:$PORT $NC"

