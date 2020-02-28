#!/bin/bash

JSON=$(for i in `cat /etc/zabbix/scripts/grandstream1_list.txt`; do printf "{\"{#GRNDSTRM1}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"