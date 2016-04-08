#!/bin/bash
read -p "IP: " i
read -p "Port: " p
read -p "Key: " k
while :; do
nc -l -p $p 2>/dev/null|openssl aes-256-cbc -d -a -k $k &
read m
echo $m|openssl aes-256-cbc -a -salt -k $k|nc $i $p -c
done;