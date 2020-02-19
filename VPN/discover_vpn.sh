#!/bin/bash

path=/etc/openvpn/ccd

users=`ls -F $path | sed 's/\///g'`

echo "{"
echo "\"data\":["

comma=""
for user in $users
do
    echo "    $comma{\"{#VPNUSER}\":\"$user\"}"
    comma=","
done

echo "]"
echo "}"
