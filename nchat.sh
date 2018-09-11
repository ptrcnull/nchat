#!/bin/bash
while :; do
nc -l -p $2 2>/dev/null|openssl aes-256-cbc -d -a -k $3 &
read m
echo $m|openssl aes-256-cbc -a -salt -k $3|nc $1 $2 -c
done;
