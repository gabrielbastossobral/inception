include ./srcs/.env

DOCKER_COMPOSE := docker-compose -f ./srcs/docker-compose.yml

up:
	$(DOCKER_COMPOSE) up -d --build

down:
	$(DOCKER_COMPOSE) down -v

restart:
	$(DOCKER_COMPOSE) down -v
	$(DOCKER_COMPOSE) up -d --build

clean:
	$(DOCKER_COMPOSE) down -v
	rm -rf requirements/nginx/tools/ssl/*.crt requirements/nginx/tools/ssl/*.key
	rm -rf requirements/wordpress/tools/*.log
	rm -rf requirements/mariadb/tools/*.sql