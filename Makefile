.PHONY: all build install run clean


all: build install run

build:
	@npm run build

install:
	@npm install

run:
	@npm run dev

up:
	@docker compose up --build -d

up-dev:
	@docker compose up --build dev -d

up-prod:
	@docker compose up --build production -d

down:
	@docker compose down

dshell:
	@docker exec -it $(CONTAINER_INFO) /bin/sh


clean:
	@rm -rf node_modules
	@rm -rf dist
	@rm -rf .cache
	@rm -rf .parcel-cache
	@rm -rf .nyc_output
	@rm -rf coverage