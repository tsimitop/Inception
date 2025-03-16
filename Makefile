# __________________________GENERAL__________________________
build_all:
	cd srcs && docker-compose up -d --build

sr_all: nsr wpsr

interact_all:
	docker exec -it /bin/bash

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
	cd srcs/requirements/wordpress && docker stop wp-php

wprm:
	cd srcs/requirements/wordpress && docker rm wp-php

wpsr:
	cd srcs/requirements/wordpress && docker stop wp-php && docker rm wp-php

wpinteract:
	docker exec -it wp-php /bin/bash

# __________________________MARIADB___________________________