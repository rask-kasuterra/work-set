.PHONY: start

include .env

start:
	docker-compose up -d

psql:
	psql -U$(POSTGRES_USER) -hlocalhost -p$(POSTGRES_PORT) $(POSTGRES_DB)