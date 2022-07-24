# nginx-php-laravel

Run :
```
git clone https://github.com/raijp/nginx-php-laravel.git && cd nginx-php-laravel
docker build -t npl .
docker rm -f npl
docker run -it -p 8081:80 -d --name npl npl /bin/bash
docker exec -it npl /bin/bash -c "service nginx start && service php8.1-fpm start"
curl 127.0.0.1:8081/php-test.php
```
