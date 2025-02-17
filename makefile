.PHONY: start-laravel-docker init-laravel-docker clear-dangerous

start-laravel-docker:
	@make build
	@make up
	./setup_containers.sh
	docker compose exec app composer install
	docker compose exec app cp .env.example .env
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache

init-laravel-docker:
	mkdir src
	./setup_containers.sh
	docker compose build
	docker compose up -d
	docker compose exec app composer create-project --prefer-dist laravel/laravel .
	docker compose exec app php artisan key:generate
	docker compose exec app php artisan storage:link
	docker compose exec app chmod -R 777 storage bootstrap/cache

clear-dangerous:
	@echo "Warning: This action will delete laravel-app and docker-compose!"
	@read -p "Are you sure you want to proceed? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
		make down-v; \
		rm -r src; \
		rm docker-compose.yml; \
		rm .env; \
	else \
		echo "Clear action canceled."; \
	fi

build:
	docker compose build

up:
	docker compose up --detach

down-v:
	docker compose down --remove-orphans --volumes