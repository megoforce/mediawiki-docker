#!/bin/bash
echo ${MYSQL_PORT_3306_TCP_ADDR}
echo ${MYSQL_PORT_3306_TCP_PORT} 
echo ${MYSQL_ENV_MYSQL_ROOT_PASSWORD}
# mysql --host=${MYSQL_PORT_3306_TCP_ADDR} --port=${MYSQL_PORT_3306_TCP_PORT} -uroot -p${MYSQL_ENV_MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS mediawiki"
mv -v /var/www/html/LocalSettings.php /var/www/html/LocalSettings.php.bak
php maintenance/install.php --dbname mediawiki --dbserver ${MYSQL_PORT_3306_TCP_ADDR}:${MYSQL_PORT_3306_TCP_PORT} --dbpass ${MYSQL_ENV_MYSQL_ROOT_PASSWORD} --pass hackme ${WIKI_NAME} admin
mv -v /var/www/html/LocalSettings.php.bak /var/www/html/LocalSettings.php