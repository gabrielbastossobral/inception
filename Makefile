COMPOSE=docker-compose -f srcs/docker-compose.yml

all: copyenv build up

up: 
	${COMPOSE} up -d

build:
	${COMPOSE} build

down:
	${COMPOSE} down

copyenv:
	cp ${HOME}/idkenv.txt ./srcs/.env

prune:
	docker system prune

fix-permissions:
	docker exec -it wordpress chown -R www-data:www-data /var/www/html

clean:
	${COMPOSE} down -v --rmi all

fclean: clean prune

re: fclean all

ok: # for debugging
	sudo rm -rf ~/data/db
	sudo rm -rf ~/data/wp
	mkdir -p ~/data/db
	mkdir -p ~/data/wp
	sudo chmod 777 ~/data/db
	sudo chmod 777 ~/data/wp

.PHONY: all up build down copyenv prune fix-permissions clean fclean re ok