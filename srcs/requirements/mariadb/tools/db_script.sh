#!/bin/bash

# DB_NAME=${WP_DB_NAME}
# DB_USER=${WP_ADMIN_USER}
# DB_PASS=${WP_ADMIN_PASSWORD}
# DB_HOST=${WP_DB_HOST}

cat << EOF > /etc/mysql/db_init.sql
CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
CREATE USER '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# #!/bin/bash

# #_______________________________________________________________________________
# # Load environment variables from .env file
# echo "Attempting to load variables from .env file"
# if [ -f .env ]; then
# 	echo -e "\e[32mFound .env file.\e[0m"
# 	export $(grep -v '^#' .env | xargs)
# else
# 	echo -e "\e[31m.env file not found.\e[0m"
# 	exit 1
# fi

# #_______________________________________________________________________________
# # Ensure all required variables are set
# # if [ -z "$SQL_DATABASE" ] || [ -z "$SQL_USER" ] || [ -z "$SQL_PASSWORD" ]; then
# # 	echo -e "\e[31mMissing required environment variables.\e[0m"
# # 	exit 1
# # fi

# # Ensure all required variables are set. Default "Not found" if not set
# SQL_DATABASE=${SQL_DATABASE:-"Not found"}
# SQL_USER=${SQL_USER:-"Not found"}
# SQL_PASSWORD=${SQL_PASSWORD:-"Not found"}

# #_______________________________________________________________________________
# # Check and display only if any variable is "Not found"
# echo "Validating variables..."
# if [ "$SQL_DATABASE" = "Not found" ]; then
# 	echo -e "\e[33mSQL_DATABASE is Not found\e[0m"
# 	exit 1
# fi

# if [ "$SQL_USER" = "Not found" ]; then
# 	echo -e "\e[33mSQL_USER is Not found\e[0m"
# 	exit 1
# fi

# if [ "$SQL_PASSWORD" = "Not found" ]; then
# 	echo -e "\e[33mSQL_PASSWORD is Not found\e[0m"
# 	exit 1
# fi

# # Exit if any required variable is missing
# # if [ "$SQL_DATABASE" = "Not found" ] || [ "$SQL_USER" = "Not found" ] || [ "$SQL_PASSWORD" = "Not found" ]; then
# # 	echo -e "\e[31mError: One or more required environment variables are missing.\e[0m"
# # 	exit 1
# # fi

# #_______________________________________________________________________________
# # Replace placeholders in the SQL file with environment variable values
# sed -e "s/${SQL_DATABASE}/$SQL_DATABASE/g" \
# 	-e "s/${SQL_USER}/$SQL_USER/g" \
# 	-e "s/${SQL_PASSWORD}/$SQL_PASSWORD/g" db_init.sql > temp_db_init.sql

# #_______________________________________________________________________________
# # Execute the SQL script
# echo "Executing script temp_db_init.sql."
# # -z = if empty
# if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
# 	echo -e "\e[31mError: MYSQL_ROOT_PASSWORD is not set.\e[0m"
# 	exit 1
# fi
# mysql -u root -p "$MYSQL_ROOT_PASSWORD" < temp_db_init.sql # what if not set
# # -ne = not equal
# if [ $? -ne 0 ]; then
# 	echo -e "\e[31mError: MySQL script execution failed.\e[0m"
# 	exit 1
# fi
# # mysql -u root -p < temp_db_init.sql # safer, will need user

# #_______________________________________________________________________________
# # Delete temporary SQL file
# echo "Deleting temp_db_init.sql."
# rm temp_db_init.sql

# #_______________________________________________________________________________
# echo -e "\e[32mDatabase initialized successfully!\e[0m"
