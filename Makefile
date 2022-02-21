all: help

help: ## Show help
	@grep -E '(^[a-zA-Z0-9_\-\.]+:.*?##.*$$)|(^##)' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

####################
## Install / Dev
####################

install: network.create image.pull image.build install.front start ## Installs everything

network.create:
	docker network create app-proxy | exit 0

image.pull: ## Pulls all images
	docker-compose pull

image.build: ## Builds all images
	docker-compose build

install.front: ## Installs yarn dependencies
	docker-compose run --rm front yarn --pure-lockfile

start: ## Starts docker-compose
	docker-compose up -d

stop: ## Stops docker-compose
	docker-compose down --remove-orphans

restart: stop start ## Stops and starts docker-compose

logs.watch: ## Show docker-compose logs
	docker-compose logs -f



####################
## Shell
####################

front.shell: ## Open front container shell
	docker-compose exec front bash

####################
## Static analysis
####################

front.lint: ## Checks angular lint issues
	docker-compose exec front yarn lint

front.lint.fix: ## Fixes angular lint issues
	docker-compose exec front yarn lint:fix

front.prettier: ## Checks angular lint issues
	docker-compose exec front yarn prettier:check

front.prettier.fix: ## Checks angular lint issues
	docker-compose exec front yarn prettier:fix

front.static.fix: front.prettier.fix front.lint.fix ## Fixes all angular lint issues






