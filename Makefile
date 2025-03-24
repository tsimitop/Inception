VOLUMES_PATH = $(HOME)/data

all: create_env create_path build_all

create_env:
	@if [ -f "srcs/.env" ]; then \
		echo ".env exists"; \
	else \
		echo "Creating .env"; \
		python3 srcs/environment.py; \
	fi

create_path:
	mkdir -p $(VOLUMES_PATH)/wordpress_vol
	mkdir -p $(VOLUMES_PATH)/mariadb_vol

logs: 
	docker logs nginx && docker logs mariadb && docker logs wordpress

abolish: sr_all delete_volumes
	cd srcs && rm .env

delete_env:
	cd srcs && rm .env

delete_volumes:
	cd srcs/ && rm -rf wordpress_vol && cd .. && docker volume rm srcs_mariadb_vol 
#srcs_wordpress_vol

# enter database prompt
# docker exec -it mariadb mysql -u root -p
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