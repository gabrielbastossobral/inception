FROM debian:bullseye

RUN apt update && apt install -y nginx openssl && apt clean

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/ssl/${DOMAIN_NAME}.crt /etc/ssl/certs/${DOMAIN_NAME}.crt
COPY tools/ssl/${DOMAIN_NAME}.key /etc/ssl/private/${DOMAIN_NAME}.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]