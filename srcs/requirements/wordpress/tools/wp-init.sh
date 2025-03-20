#!/bin/bash

# while ! mysqladmin ping -h"$WP_DB_USER" -u"$WP_ADMIN_USER" -p"$WP_DB_PASSWORD" --silent; do
# 	echo "Waiting for MariaDB to be ready..."
# 	echo "WP_DB_USER = $WP_DB_USER"
# 	echo "WP_ADMIN_USER = $WP_ADMIN_USER"
# 	echo "WP_DB_PASSWORD = $WP_DB_PASSWORD"
# 	sleep 1
# done

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASSWORD --dbhost=$WP_DB_HOST --allow-root
./wp-cli.phar core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
./wp-cli.phar user create $WP_USER $WP_EMAIL --role=editor --user_pass=$WP_PASS --allow-root

php-fpm7.4 -F
# php-fpm8.2 -F
