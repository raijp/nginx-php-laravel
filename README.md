# nginx-php-laravel

<br>nginx : 1.18.0
<br>php: 8.1
<br>laravel: latest

1. Run :
```
git clone https://github.com/raijp/nginx-php-laravel.git && cd nginx-php-laravel
docker build -t npl .
docker run -it -p 8081:80 -d --name npl npl /bin/bash
docker exec -it npl /bin/bash -c "service nginx start && service php8.1-fpm start"
# If you want to delete the container, run below.
# docker rm -f npl
```

2. Navigate to http://127.0.0.1:8081
