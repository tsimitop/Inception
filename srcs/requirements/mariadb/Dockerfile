# some Debian
FROM debian:bullseye
FROM debian:buster
FROM debian:bookworm
FROM debian:stable
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y mariadb-server && apt-get clean && rm -rf /var/lib/apt/lists/*

# should I call it 50-server.cnf
COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf 

EXPOSE

CMD 
