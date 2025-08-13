up:
	docker-compose up -d --build

down:
	docker-compose down -v

restart:
	docker-compose down -v
	docker-compose up -d --build

clean:
	docker-compose down -v
	rm -rf requirements/nginx/tools/ssl/*.crt requirements/nginx/tools/ssl/*.key
	rm -rf requirements/wordpress/tools/*.log
	rm -rf requirements/mariadb/tools/*.sql