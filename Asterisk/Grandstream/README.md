# Zabbix-Asterisk-Grandstream-Templates
Шаблоны и скрипты мониторинга VOIP-телефонов Grandstream (bash scripts for debian 10)<br>
<br>
**Описание работы:**<br>
Скрипты и шаблоны проверяют телефоны Grandstream на регистрацию с Asterisk. Составлено на основании [официального гайда](http://www.grandstream.com/sites/default/files/Resources/CTI_Guide.pdf).<br>
<br>
Вывод с аппаратов серии GXP1xxx (1450, 1610): `{"response":"success", "body": "available", "misc": "0"}`<br>
Вывод с аппаратов серии GXP21xx (2124, 2160): `{ "response": "success", "body": "available", "misc": "0" }`<br>
В связи с разностью выводов пришлось делать два шаблона и два скрипта. Возможно, позже удасться победить эту проблему с выводом и ограничиться одним шаблоном и одним универсальным скриптом.<br>
<br>
**Список шаблонов и скриптов:**
1. *Template_Grandstream1.xml* - основной шаблон для мониторинга состояния регистрации GXP 1xxx.<br>
2. *Template_Grandstream2.xml* - основной шаблон для мониторинга состояния регистрации GXP 21xx.<br>
3. *grandstream1.sh* - скрипт проверки состояния регистрации телефонов GXP 1xxx.<br>
4. *grandstream2.sh* - скрипт проверки состояния регистрации телефонов GXP 21xx.<br>
5. *grandstream1.conf* - конфиг проверки состояния регистрации телефонов GXP 1xxx.<br>
6. *grandstream2.conf* - конфиг проверки состояния регистрации телефонов GXP 21xx.<br>
7. *grandstream1_list.txt* - пустой файл для списка телефонов GXP 1xxx.<br>
8. *grandstream2_list.txt* - пустой файл для списка телефонов GXP 21xx.<br>

**Информация о выводах в шаблонах**
1. Состояние регистрации аккаунта на сервере Asterisk.<br>
1.1. Триггер на отвалившуюуся регистрацию.

**Установка и настройка**
1. На машине с zabbix-agent сохраняем пустые txt-файлы и sh-скрипты в папке **/etc/zabbix/scripts** (если папки нет - создаём). Даём скриптам права на запуск.
2. Сохраняем конфиги в папке **/etc/zabbix/zabbix_agent.d/**.
3. Перезапускаем zabbix-agent: `systemctl restart zabbix-agent`.
4. **Для телефонов GXP21xx** в web-интерфейсе включить (Network - Remote Control):<br>
- Action URI Support: Enabled<br>
- Remote Control Pop up Windows Support: Disabled<br>
- Action URI Allowed IP List: any<br>
- CSTA Control: Disabled<br>
5. Импортируем шаблоны в zabbix-server и привязываем их к хосту, на который копировали пустые файлы, скрипты и конфиги.