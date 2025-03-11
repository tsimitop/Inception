--get ${values} from .env

-- Create the WordPress database if it does not exist
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};

-- Create a new user for WordPress
CREATE USER IF NOT EXISTS ${SQL_USER}@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';

-- Grant all privileges of the WordPress database to the new user
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%' IDENTIFIED BY '${SQL_PASSWORD}';

--Refresh to ensure above changes take effect
FLUSH PRIVILEGES;
