#!/bin/bash

# Получаем количество всех транков в системе
total=`sudo asterisk -rx 'iax2 show peers' | sed -n '/iax2/p' | awk '{print $1}'`
 
# Получаем число активных транков
active=`sudo asterisk -rx 'iax2 show peers' | sed -n '/OK/p' | wc -l`

# Получаем имена транков с проблемам
offline=`sudo asterisk -rx 'iax2 show peers' | sed -n '/UNREACHABLE/p' | awk '{print $1}'`

# Сравниваем общее число с числом активных транков и выводим сообщение об их состоянии
if [ $active -lt $total ]
then
echo Trunks offline $offline
else
echo All trunks are online
fi