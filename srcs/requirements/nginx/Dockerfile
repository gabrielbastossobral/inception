FROM debian:bullseye

ARG DOMAIN_NAME
ENV DOMAIN_NAME=${DOMAIN_NAME}

RUN apt update && \
    apt install -y nginx openssl gettext-base && \
    apt clean

COPY tools/generate.cert.sh /generate_cert.sh
RUN chmod +x /generate_cert.sh && /generate_cert.sh "${DOMAIN_NAME}"

COPY conf/nginx.conf /nginx.conf.template
RUN envsubst '${DOMAIN_NAME}' < /nginx.conf.template > /etc/nginx/nginx.conf

RUN cp /etc/ssl/certs/${DOMAIN_NAME}.crt /etc/ssl/certs/${DOMAIN_NAME}.crt && \
    cp /etc/ssl/private/${DOMAIN_NAME}.key /etc/ssl/private/${DOMAIN_NAME}.key

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]