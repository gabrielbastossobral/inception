FROM debian:bullseye

RUN apt update && apt install -y php php-fpm php-mysql wget tar && apt clean

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

COPY conf/wp-config.php /var/www/html/wp-config.php

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]