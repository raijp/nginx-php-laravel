FROM ubuntu:jammy

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install curl -y
RUN apt-get install nginx=1.18.0-6ubuntu14.1 -y
RUN apt-get install php8.1-fpm -y

COPY etc/nginx/sites-available/default /etc/nginx/sites-available/default
COPY var/www/html/php-test.php /var/www/html/

CMD ["/bin/bash"]
