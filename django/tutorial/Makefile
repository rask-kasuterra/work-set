.PHONY: build-dev create-app \
		create-table create-migration exec-migration connect-model run-server-dev start-dev exec-dev \
		build exec stop

include .make_env
STAGE=dev

#===
# 開発環境作成コマンド
#===

# dev
build-dev:
	docker build -f Dockerfile.$(STAGE) -t $(IMAGE_NAME)-$(STAGE) .
	-docker rm -f $(CONTAINER_NAME)-$(STAGE)
	docker run -p 8001:8001 -v $$PWD:/app -d --name $(CONTAINER_NAME)-$(STAGE) $(IMAGE_NAME)-$(STAGE) tail -f /dev/null

create-app:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) django-admin startproject $(PJ_NAME) .
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py startapp $(APP_NAME)

# テーブルの作成
create-table:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py migrate

# migration ファイルの作成
create-migration:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py makemigrations polls

# migration ファイルを用いてテーブルを作成
exec-migration:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py sqlmigrate polls 0001

# 管理者ユーザの作成
create-admin:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py createsuperuser

#===
# 開発用コマンド
#===

# テーブルへの接続
connect-model:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py shell

# web サーバの起動
run-server:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) bash -c "python manage.py runserver 0.0.0.0:8001"
#	docker exec -it $(CONTAINER_NAME)-$(STAGE) bash -c "python manage.py runserver 0.0.0.0:8000 > /dev/null 2>&1 &"

start-dev:
	docker start $(CONTAINER_NAME)-$(STAGE)

stop-dev:
	docker stop $(CONTAINER_NAME)-$(STAGE)

exec-dev:
	-docker exec -it $(CONTAINER_NAME)-$(STAGE) bash

#===
# テスト用コマンド
#===

# テストの実行
run-test:
	docker exec -it $(CONTAINER_NAME)-$(STAGE) python manage.py test

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
