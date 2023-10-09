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

precheck-react:
	@echo "CONTAINER_NAME: $(CONTAINER_NAME)"
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
	docker build --no-cache -f Dockerfile.dev -t $(IMAGE_NAME)-dev .
	-docker rm -f $(CONTAINER_NAME)-dev
	docker run -p $(DEV_PORT):3000 -v $$PWD:/app -d --name $(CONTAINER_NAME)-dev $(IMAGE_NAME)-dev tail -f /dev/null

create-app: precheck-react
	docker exec -it $(CONTAINER_NAME)-dev npx create-next-app@latest ${APP_NAME} --use-npm

create-app-example: precheck-react
	docker exec -it $(CONTAINER_NAME)-dev npx create-next-app@latest ${APP_NAME} --use-npm --example "https://github.com/vercel/next-learn/tree/main/basics/learn-starter"

#===
# 開発用コマンド
#===

# web サーバの起動
run-server:
	docker exec -it $(CONTAINER_NAME)-dev bash -c "cd nextjs-blog && npm run dev"

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
