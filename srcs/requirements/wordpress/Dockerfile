FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y php7.4 php7.4-fpm php7.4-mysql wget php-mysqli default-mysql-client curl && apt-get clean && rm -rf /var/lib/apt/lists/*

# Ensure the directory for the socket exists
RUN mkdir -p /run/php && chown www-data:www-data /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d

COPY ./tools/wp-init.sh .

RUN chmod +x wp-init.sh

EXPOSE 9000

CMD ["./wp-init.sh"]
