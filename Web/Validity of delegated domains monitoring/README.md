# Zabbix-Domain
Шаблоны и скрипты для мониторинга времени делегирования доменов для Zabbix 4.4

**Описание шаблонов и скриптов:**
1. *domain.conf* - конфиг агента с пользовательсими параметрами.
2. *domain_discovery.sh* - скрипт для передачи в заббикс.
3. *domain_left.sh* - скрипт парсит вывод утилиты и выводит остаток дней оплаченной аренды (точно работает для ru, su, рф, com).
4. *domain_list.txt* - пустой файл для списка доменов.
5. *Template_domain_expiration.xml* - шаблон для сервера


**Работа с файлами, скриптами и шаблоном**

1. Копируем *domain.conf* в /etc/zabbix/zabbix_agentd.d,
2. копируем скрипты и текстовый файл в папку /etc/zabbix/scripts. В текстовый файл необходимо добавить домены по одному на каждую строку.

3. Устанавливаем пакет whois:<br>
`# apt-get install whois`

4. Устанавливаем скриптам права на запуск:<br>
`# cd /etc/zabbix/scripts/`<br>
`# chmod 0755 domain_discovery.sh domain_left.sh`

5. Перезапускаем агента:<br>
`# systemctl restart zabbix-agent`

6. Импортируем шаблон *Template_domain_expiration.xml* и привязываем его к хосту (например, Zabbix server).




*[source](https://serveradmin.ru/monitoring-vremeni-delegirovaniya-domena-v-zabbix)*