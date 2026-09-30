.PHONY: build up down logs migrate superuser shell

build:
	docker compose build
up:
	docker compose up -d --build
down:
	docker compose down
logs:
	docker compose logs -f backend
migrate:
	docker compose exec backend python manage.py migrate
superuser:
	docker compose exec backend python manage.py createsuperuser
shell:
	docker compose exec backend bash

BACKEND_IMAGE = nxttrendz-backend
 
build-image:
	docker build -t $(BACKEND_IMAGE) ./backend
 
run-image:
	docker run $(BACKEND_IMAGE)
 
remove-image:
	docker rmi $(BACKEND_IMAGE)