# some Debian
FROM debian:bullseye
FROM debian:buster
FROM debian:bookworm
FROM debian:stable
FROM debian:bookworm-slim

#php7.3 check for other
RUN apt-get update && apt-get install -y wget php7.4 php-fpm php-mysql mariadb-client && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 3306

#check path
CMD ["/usr/local/bin/db_script.sh"]


# #____________________________________________________________
# # Set environment variables for MariaDB
# ENV MYSQL_ROOT_PASSWORD=rootpassword

# # Expose MariaDB port
# EXPOSE 3306

# # Run initialization and start MariaDB server
# CMD ["sh", "-c", "mysql -u root -p$MYSQL_ROOT_PASSWORD < /usr/local/bin/db_init.sql && mysqld"]