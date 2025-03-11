#!/bin/bash

# Wait for MariaDB to be ready
sleep 10

# Check if wp-config.php exists
if [ ! -f "/var/www/html/wp-config.php" ]; then
	echo "Configuring WordPress..."

	# Use WP CLI to create the wp-config.php file
	wp config create \
		--dbname="${my_database_name}" \
		--dbuser="${my_database_user}" \
		--dbpass="${my_database_password}" \
		--dbhost=mariadb:3306 --allow-root

	echo "WordPress configuration completed."
else
	echo "wp-config.php already exists, skipping configuration."
fi

