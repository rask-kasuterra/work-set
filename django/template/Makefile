.PHONY: build
.PHONY: exec
.PHONY: stop

include .make_env

build-dev:
	docker build -f Dockerfile.dev -t $(IMAGE_NAME)-dev .
	-docker rm -f $(CONTAINER_NAME)-dev
	docker run -p 8000:8000 -v $$PWD:/app -d --name $(CONTAINER_NAME)-dev $(IMAGE_NAME)-dev tail -f /dev/null

create-django-app:
	docker exec -it $(CONTAINER_NAME)-dev django-admin startproject $(PJ_NAME) .
	docker exec -it $(CONTAINER_NAME)-dev python manage.py startapp $(APP_NAME)

run-server-dev:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py runserver 0.0.0.0:8000

build:
	docker build -t $(IMAGE_NAME) .
	-docker rm -f $(CONTAINER_NAME)
	docker run -p 8000:8000 -d --name $(CONTAINER_NAME) $(IMAGE_NAME) tail -f /dev/null

exec:
	-docker exec -it $(CONTAINER_NAME) bash

stop:
	docker stop $(CONTAINER_NAME)
