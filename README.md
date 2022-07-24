# nginx-php-laravel

Run :
```
docker build -t npl .
docker rm -f npl
docker run -it -p 8081:80 -d --name npl npl /bin/bash
docker exec -it npl /bin/bash -c "service nginx start && service php8.1-fpm start"
curl 127.0.0.1:8081/php-test.php
```
