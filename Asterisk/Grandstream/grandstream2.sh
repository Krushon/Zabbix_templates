#!/bin/bash

# Проверка на ввод ip-адреса в ручном режиме
#if [ -z "$1" ]
#	then
#		echo -en "No value set. Syntax: grandstream2.sh 192.168.0.1\n"
#		exit 1
#fi

GRNDSTRM2="$1"
# Указываем пароль от телефона
passcode="admin"

url="http://$GRNDSTRM2/cgi-bin/api-get_phone_status?passcode=$passcode"
status=`wget $url -q -O - | awk '{print $5}' | awk -F\" '{print $2}'`

if [[ $status = "available" || $status = "busy" ]]
	then
		printf 1
	else
		printf 0
fi
