# Zabbix-SSL
Шаблоны и скрипты для мониторинга срока действия SSL для Zabbix 4.4

**Описание шаблонов и скриптов:**
1. *ssl.conf* - файл c расширением конфигурации заббикса.
2. *ssl_https_check.sh* - скрипт, определяющий сколько дней осталось до окончания срока действия сертификата вэб-сайта.
3. *ssl_https_discovery.sh* - скрипт для автообнаружения вэб-сайтов из файла *ssl_https_list.txt* и передачи в zabbix.
4. *ssl_https_list.txt* - пустой файл для создания списка доменов вэб-сайтов.
5. *ssl_smtp_check.sh* - скрипт, определяющий сколько дней осталось до окончания срока действия сертификата почтового сервера.
6. *ssl_smtp_discovery.sh* - скрипт для автообнаружения почтовых серверов из файла *ssl_smtp_list.txt* и передачи в zabbix.
7. *ssl_smtp_list.txt* - пустой файл для создания списка доменов почтовых серверов.
8. *Template_ssl_cert_expiration.xml* - шаблон для сервера.

**Работа с файлами, скриптами и шаблоном**

1. Файл *ssl.conf* копируем в /etc/zabbix/zabbix_agentd.d.

2. Файлы *ssl_https_list.txt* и *ssl_smtp_list.txt* копируем в /etc/zabbix/scripts. В эти файлы необходимо добавить домены по одному на каждую строку.

3. Скрипты копируем в /etc/zabbix/scripts.

4. Делаем эти скрипты исполняемыми: <br>
`# cd /etc/zabbix/scripts`<br>
`# chmod 0740 ssl_https_check.sh ssl_https_discovery.sh ssl_smtp_check.sh ssl_smtp_discovery.sh`

5. В файле /etc/zabbix/zabbix_agentd.conf рекомендуется увеличить Timeout до 10.

6. Делаем пользователя zabbix владельцем всех скриптов:<br>
`# chown -R zabbix. /etc/zabbix/scripts`

7. Перезапускаем агента:<br>
`# systemctl restart zabbix-agent`

8. Импортируем шаблон *Template_ssl_cert_expiration.xml* и привязываем его к хосту (например, Zabbix server).

9. Триггер в шаблоне установлен на 7 дней. Можно его настроить на другое время по желанию. Рекомендуется также настроить повторяющиеся уведомления для триггеров из текущего шаблона.

**Возможные проблемы**

1. Некоторые ssl-сертификаты не определяются, скрипт выводит 0 при действующем сертификате - см. [Issues #1](https://github.com/Krushon/Zabbix_templates/issues/1)


_______
*[source](https://serveradmin.ru/monitoring-sroka-deystviya-ssl-sertifikata-v-zabbix)*