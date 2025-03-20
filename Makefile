# __________________________GENERAL__________________________

rebuild:
	cd srcs && docker-compose build --no-cache

build_all:
	cd srcs && docker-compose up -d --build

build_fast:
	cd srcs && docker-compose up -d

sr_all: nsr wpsr msr

# interact_all:
# 	docker exec -it /bin/bash

# ___________________________NGINX___________________________
ssh-nginx:
	docker-compose -f srcs/docker-compose.yml exec nginx bash

build_nginx:
	cd srcs/requirements/nginx && docker-compose up -d --build

nstop:
	cd srcs/requirements/nginx && docker stop nginx

nrm:
	cd srcs/requirements/nginx && docker rm nginx

nsr:
	cd srcs/requirements/nginx && docker stop nginx && docker rm nginx

ninteract:
	docker exec -it nginx /bin/bash
# _________________________WORDPRESS__________________________
ssh-wp:
	docker-compose -f srcs/docker-compose.yml exec wp bash

build_wp:
	cd srcs/requirements/wordpress && docker-compose up -d --build

wpstop:
	cd srcs/requirements/wordpress && docker stop wordpress

wprm:
	cd srcs/requirements/wordpress && docker rm wordpress

wpsr:
	cd srcs/requirements/wordpress && docker stop wordpress && docker rm wordpress

wpinteract:
	docker exec -it wordpress /bin/bash

# __________________________MARIADB___________________________

minteract:
	docker exec -it mariadb /bin/bash

msr:
	cd srcs/requirements/mariadb && docker stop mariadb && docker rm mariadb