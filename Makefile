VOLUMES_PATH = $(HOME)/data

all: create_env create_path build_all

# Create .env file
create_env:
	@if [ -f "srcs/.env" ]; then \
		echo ".env exists"; \
	else \
		echo "Creating .env"; \
		python3 srcs/requirements/tools/environment.py; \
	fi

# Create necessary directories
create_path:
	mkdir -p $(VOLUMES_PATH)/wordpress_vol
	mkdir -p $(VOLUMES_PATH)/mariadb_vol

# Build images using cache
build:
	cd srcs && docker-compose build

# Build images without cache
rebuild:
	cd srcs && docker-compose build --no-cache

# Start services without rebuilding
up:
	cd srcs && docker-compose up -d

# Build images and start services
build_all:
	cd srcs && docker-compose up -d --build

# Start services without building
build_fast:
	cd srcs && docker-compose up -d

# Stop and remove containers
down:
	cd srcs && docker-compose down

# Restart containers without rebuilding
restart:
	cd srcs && docker-compose down && docker-compose up -d

# Completely reset environment (remove containers, volumes and networks)
reset:
	cd srcs && docker-compose down -v --remove-orphans
	cd srcs && docker-compose up -d --build

# Show logs
logs: 
	docker logs nginx && docker logs mariadb && docker logs wordpress

# Delete .env file
delete_env:
	cd srcs && rm .env

# Delete volumes
delete_volumes:
	docker volume rm srcs_mariadb_vol && docker volume rm srcs_wordpress_vol && cd $(VOLUMES_PATH) && rm -rf mariadb_vol && rm -rf wordpress_vol

# Interact with nginx
interact_nginx:
	docker exec -it nginx /bin/bash

# Interact with mariadb
interact_mariadb:
	docker exec -it mariadb /bin/bash

# Interact with wordpress
interact_wordpress:
	docker exec -it wordpress /bin/bash

# Navigate mariadb
enter_db_prompt:
	docker exec -it mariadb mysql -u root -p

clean: down

fclean:
	cd srcs && docker-compose down -v --remove-orphans
	cd srcs && docker system prune -af --volumes

re: fclean all

# eval_rule:
# 	docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
