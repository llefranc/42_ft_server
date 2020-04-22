FROM debian:buster

# install the following packages : nginx, mariadb, php 7.3, wget, curl
RUN apt-get update && apt-get install -y nginx mariadb-server mariadb-client systemd \
	php-fpm php-mysql php-mbstring php-zip php-gd php-xml php-pear php-gettext php-cgi \
	wget curl
# download and extract phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
RUN mkdir /usr/share/nginx/html/phpmyadmin
RUN tar xzf phpMyAdmin-5.0.2-english.tar.gz --strip-components=1 -C /usr/share/nginx/html/phpmyadmin
# download and extract wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN mkdir /usr/share/nginx/html/wordpress
RUN tar xzf latest.tar.gz --strip-components=1 -C /usr/share/nginx/html/wordpress

# nginx configuration file
COPY srcs/nginx.conf /etc/nginx/conf.d/nginx.conf 
# test file for php 7.3
COPY srcs/info.php /usr/share/nginx/html/info.php
# config file for phpmyadmin
COPY srcs/config.inc.php /usr/share/nginx/html/phpmyadmin/config.inc.php
# config file for wordpress
COPY srcs/wp-config.php /usr/share/nginx/html/wordpress/wp-config.php
# script creating new user for mariadb + new db
COPY srcs/create_user.sql /home/docker/script/create_user.sql
# script that starts when the container is launched
COPY srcs/service_start.sh /home/docker/script/service_start.sh

# adds authentification keys to wordpress config file
# >> getting the keys
RUN curl -s https://api.wordpress.org/secret-key/1.1/salt/ > /home/docker/tmp
# >> inserting the keys at the right place in wordpress config file
RUN sed -i -e '/\/\* insert keys here \*\//r /home/docker/tmp' /usr/share/nginx/html/wordpress/wp-config.php
RUN rm -rf /home/docker/tmp

# rights for phpmyadmin / wordpress
RUN chmod 660 /usr/share/nginx/html/phpmyadmin/config.inc.php
RUN chown -R www-data:www-data /usr/share/nginx/html/phpmyadmin
RUN chmod 660 /usr/share/nginx/html/wordpress/wp-config.php
RUN chown -R www-data:www-data /usr/share/nginx/html/wordpress

# script that will be launch when the container will be started
ENTRYPOINT /home/docker/script/service_start.sh
WORKDIR /home/docker
