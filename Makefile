
# ___________________________NGINX___________________________
ssh-nginx:
	docker-compose -f srcs/docker-compose.yml exec nginx bash

build nginx:
	cd srcs/requirements/nginx && docker-compose up -d --build

build nstop:
	cd srcs/requirements/nginx && docker stop nginx

build nrm:
	cd srcs/requirements/nginx && docker rm nginx

build nsr:
	cd srcs/requirements/nginx && docker stop nginx && docker rm nginx
