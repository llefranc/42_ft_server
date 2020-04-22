# !/bin/bash
rm /etc/nginx/sites-enabled/default
service nginx start
service mysql start
service php7.3-fpm start
mysql < /home/docker/script/create_user.sql
while true
do
	sleep 1;
done