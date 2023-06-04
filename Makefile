SHELL = /bin/sh

UID := $(shell id -u)
GID := $(shell id -g)

export UID
export GID

shell:
	docker-compose -f docker-compose.local.yml exec -u ${UID}:${GID} next-app sh

up: init
	UID=${UID} GID=${GID} docker-compose -f docker-compose.local.yml up --build -d --remove-orphans

up-dev: init
	UID=${UID} GID=${GID} docker-compose -f docker-compose.local.yml up --build --remove-orphans

down:
	docker-compose -f docker-compose.local.yml down --remove-orphans

init:
	[ -d "./local/node_modules" ] || npm install --prefix ./local/
