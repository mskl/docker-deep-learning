# Docker compose shortcuts
build:
	docker-compose -f docker-compose.gpu.yml build

run: build
	docker-compose -f docker-compose.gpu.yml up -d --remove-orphans
	docker-compose logs -f

stop:
	docker-compose -f docker-compose.gpu.yml down

bash:
	docker-compose -f docker-compose.gpu.yml exec jupyter bash

