#!/bin/bash
set -e

DOMAIN_NAME=${DOMAIN_NAME}
SSL_PATH="/etc/ssl"

echo "🔐 Gerando certificado SSL para ${DOMAIN_NAME}..."

mkdir -p ${SSL_PATH}/certs ${SSL_PATH}/private

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ${SSL_PATH}/private/${DOMAIN_NAME}.key \
  -out ${SSL_PATH}/certs/${DOMAIN_NAME}.crt \
  -subj "/C=BR/ST=SaoPaulo/L=SaoPaulo/O=42/OU=Inception/CN=${DOMAIN_NAME}"

echo "✅ Certificado gerado em ${SSL_PATH}"