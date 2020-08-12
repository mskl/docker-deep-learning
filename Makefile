# Docker compose shortcuts
build:
	docker-compose build

run: build
	docker-compose up -d --remove-orphans
	docker-compose logs -f

stop:
	docker-compose down

bash:
	docker-compose exec jupyter bash

