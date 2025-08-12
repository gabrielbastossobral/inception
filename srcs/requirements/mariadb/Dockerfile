FROM debian:bullseye

RUN apt update && apt install -y mariadb-server && apt clean

COPY conf/init.sql /docker-entrypoint-initdb.d/

CMD ["mysqld_safe"]