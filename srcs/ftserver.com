server {
  listen 80;
  listen [::]:80;

  listen 443 ssl;

  server_name ftserver.com;
  root /usr/share/nginx/html/;
  # add index.html if autoindex is off
  index index.php index.htm index.nginx-debian.html;

  ssl_certificate /etc/nginx/ssl/nginx.crt;
  ssl_certificate_key /etc/nginx/ssl/nginx.key;

  location = / {
	autoindex on;
    try_files $uri $uri/ =404;
  }

  location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass   unix:/run/php/php7.3-fpm.sock;
  }
}
