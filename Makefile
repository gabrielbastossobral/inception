all:
	docker compose -f srcs/docker-compose.yml up -d --build
down:
	docker compose -f srcs/docker-compose.yml down--volumes

clean: down
	docker system prune -af --volumes

re: clean all