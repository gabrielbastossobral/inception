#!/bin/bash
set -e

WP_PATH="/var/www/html"
DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_PASS=$(cat /run/secrets/db_password)
DB_HOST=${DB_HOST}
DOMAIN_NAME=${DOMAIN_NAME}

echo "DB_NAME: $DB_NAME"
echo "DB_USER: $DB_USER"
echo "DB_PASS: $DB_PASS"
echo "DB_HOST: $DB_HOST"
echo "DOMAIN_NAME: $DOMAIN_NAME"

if [ ! -f ${WP_PATH}/wp-config.php ]; then
    wp core download --path=${WP_PATH} --allow-root
    wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root
    wp core install --url="https://${DOMAIN_NAME}" --title="Inception" --admin_user="admin" --admin_password="adminpass" --admin_email="admin@42.fr" --path=${WP_PATH} --skip-email --allow-root
fi

chown -R www-data:www-data ${WP_PATH}