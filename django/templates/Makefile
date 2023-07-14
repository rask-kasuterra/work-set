.PHONY: build-dev create-app \
		create-table create-migration exec-migration connect-model run-server-dev start-dev exec-dev \
		build exec stop

include .make_env

#===
# 開発環境作成コマンド
#===

# dev
build-dev:
	docker build -f Dockerfile.dev -t $(IMAGE_NAME)-dev .
	-docker rm -f $(CONTAINER_NAME)-dev
	docker run -p 8001:8001 -v $$PWD:/app -d --name $(CONTAINER_NAME)-dev $(IMAGE_NAME)-dev tail -f /dev/null

create-app:
	docker exec -it $(CONTAINER_NAME)-dev django-admin startproject $(PJ_NAME) .
	docker exec -it $(CONTAINER_NAME)-dev python manage.py startapp $(APP_NAME)

# テーブルの作成
create-table:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py migrate

# migration ファイルの作成
create-migration:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py makemigrations polls

# migration ファイルを用いてテーブルを作成
exec-migration:
	docker exec -it $(CONTAINER_NAME)-dev python manage.py sqlmigrate polls 0001

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
	docker exec -it $(CONTAINER_NAME)-dev bash -c "python manage.py runserver 0.0.0.0:8001"

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
build-server:
	docker build -t $(IMAGE_NAME) .
	-docker rm -f $(CONTAINER_NAME)
	docker run -p 8000:8000 -d --name $(CONTAINER_NAME) $(IMAGE_NAME)

start-server:
	docker start $(CONTAINER_NAME)

stop-server:
	docker stop $(CONTAINER_NAME)

exec-server:
	-docker exec -it $(CONTAINER_NAME) bash
