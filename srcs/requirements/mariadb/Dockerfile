FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y mariadb-server && \
    apt clean

COPY conf/init.sql /conf/init.sql
COPY tools/init_db.sh /init_db.sh
RUN chmod +x /init_db.sh

EXPOSE 3306

CMD ["bash", "/init_db.sh"]