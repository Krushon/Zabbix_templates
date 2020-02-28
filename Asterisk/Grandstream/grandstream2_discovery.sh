#!/bin/bash

JSON=$(for i in `cat /etc/zabbix/scripts/grandstream2_list.txt`; do printf "{\"{#GRNDSTRM2}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')
printf "{\"data\":["
printf "$JSON"
printf "]}"