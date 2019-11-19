#!/bin/bash

JSON=$(for i in `cat /etc/zabbix/scripts/ssl_https_list.txt`; do printf "{\"{#DOMAIN_HTTPS}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"