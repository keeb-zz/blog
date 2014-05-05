from ubuntu:12.04
maintainer Nick Stinemates <nick@docker.com>

run apt-get update
run apt-get install -y nginx
run echo "daemon off;" >> /etc/nginx/nginx.conf
run sed -i 's/www-data/root/' /etc/nginx/nginx.conf

add nginx.conf /etc/nginx/sites-enabled/default
volume /www

expose 80

cmd ["nginx"]
