#!/bin/bash

PORT=49562
IP=$(ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1)	# change the interface if you're using a different interface other than eth0

docker build -t nessus:v1 .
docker run -dti --name nessus -p $PORT:8834 nessus:egs bash
docker exec nessus bash -c "/etc/init.d/nessusd start"
echo "Started nessus docker on https://$IP:$PORT"
