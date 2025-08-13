#!/bin/bash
set -e

DB_NAME=${DB_NAME}
DB_USER=${DB_USER}
DB_PASS=${DB_PASS}
DB_ROOT_PASS=${DB_ROOT_PASS}

service mysql start

mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${DB_NAME};
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';
    FLUSH PRIVILEGES;
EOSQL

if [ -f /conf/init.sql ]; then
    mysql -u root -p${DB_ROOT_PASS} ${DB_NAME} < /conf/init.sql
fi

service mysql stop
