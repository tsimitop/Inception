#!/bin/bash

cat << EOF > /etc/mysql/db_init.sql
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF
