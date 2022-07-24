FROM ubuntu:jammy

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install nginx=1.18.0-6ubuntu14.1 -y
RUN apt-get install php8.1-fpm -y
RUN apt-get install php8.1-curl -y
RUN apt-get install php8.1-mbstring -y
RUN apt-get install php8.1-xml -y
RUN apt-get install unzip -y
RUN apt-get install git -y
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

COPY etc/nginx/sites-available/default /etc/nginx/sites-available/default

WORKDIR /var/www/html/
RUN composer create-project laravel/laravel example-app
WORKDIR /var/www/html/example-app/
RUN composer install
RUN chmod -R 777 storage/

CMD ["/bin/bash"]
