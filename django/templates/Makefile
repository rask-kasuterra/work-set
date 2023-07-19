.PHONY: build-dev create-app \
		create-table create-migration exec-migration connect-model run-server-dev start-dev exec-dev \
		build exec stop

include .make_env

precheck-docker:
	@echo "IMAGE_NAME: $(IMAGE_NAME)"
	@echo "CONTAINER_NAME: $(CONTAINER_NAME)"
	@echo "DEV_PORT: $(DEV_PORT)"
	@read -p "Is this correct? [Y/n]: " yn; \
	case "$$yn" in \
	  [Yy]* ) ;; \
	  * ) echo "Aborting."; exit 1;; \
	esac

precheck-django:
	@echo "APP_NAME: $(APP_NAME)"
	@read -p "Is this correct? [Y/n]: " yn; \
	case "$$yn" in \
	  [Yy]* ) ;; \
	  * ) echo "Aborting."; exit 1;; \
	esac

#===
# 開発環境作成コマンド
#===

# dev
build-dev: precheck-docker
	docker build -f Dockerfile.dev -t $(IMAGE_NAME)-dev .
	-docker rm -f $(CONTAINER_NAME)-dev
	docker run -p $(DEV_PORT):8000 -v $$PWD:/app -d --name $(CONTAINER_NAME)-dev $(IMAGE_NAME)-dev tail -f /dev/null

create-app: precheck-django
	docker exec -it $(CONTAINER_NAME)-dev django-admin startproject config .
	docker exec -it $(CONTAINER_NAME)-dev python manage.py startapp $(APP_NAME)
	mkdir -p static/$(APP_NAME)
	mkdir -p templates/$(APP_NAME)

# migration ファイルの作成
create-migration: precheck-django
	docker exec -it $(CONTAINER_NAME)-dev python manage.py makemigrations $(APP_NAME)

# migration ファイルを用いてテーブルを作成
migrate: create-migration
	docker exec -it $(CONTAINER_NAME)-dev python manage.py migrate

# 管理者ユーザの作成
create-admin:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py createsuperuser

#===
# 開発用コマンド
#===

# python での接続
connect-python:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py shell

# web サーバの起動
run-server:
	docker exec -it $(CONTAINER_NAME)-dev bash -c "python manage.py runserver 0.0.0.0:8000"

start-dev:
	docker start $(CONTAINER_NAME)-dev

stop-dev:
	docker stop $(CONTAINER_NAME)-dev

exec-dev:
	-docker exec -it $(CONTAINER_NAME)-dev bash

#===
# テスト用コマンド
#===

# テストの実行
run-test:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py test

# prd
build-server: precheck-docker
	docker build -t $(IMAGE_NAME) .
	-docker rm -f $(CONTAINER_NAME)
	docker run -p 8000:8000 -d --name $(CONTAINER_NAME) $(IMAGE_NAME)

start-server:
	docker start $(CONTAINER_NAME)

stop-server:
	docker stop $(CONTAINER_NAME)

exec-server:
	-docker exec -it $(CONTAINER_NAME) bash
