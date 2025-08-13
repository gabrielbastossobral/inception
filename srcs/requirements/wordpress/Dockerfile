FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y php php-fpm php-mysql curl wget unzip && \
    apt clean

# Instala WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup_wp.sh /setup_wp.sh
RUN chmod +x /setup_wp.sh

EXPOSE 9000

CMD ["bash", "/setup_wp.sh"]