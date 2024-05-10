.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: install
install:
	brew bundle
	MAKELEVEL=0 asdf install
	bin/setup

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: rspec
rspec:
	bundle exec rspec spec

.PHONY: build
build: rubocop rspec

.PHONY: deploy
deploy:
	RAILS_MASTER_KEY=`cat config/master.key` \
		HEROKU_APP_NAME=kamil-party-quotes \
		bin/makefile/heroku-create

.PHONY: clean
clean:
	rm -rf app/assets/builds/*
	rm -rf tmp/*
	bin/rails db:drop
	RAILS_ENV=test bin/rails db:drop

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "${YELLOW}make${NC}              this menu"
	@echo "${YELLOW}make install${NC}      install all the things"
	@echo "${YELLOW}make build${NC}        build all the things"
	@echo
	@echo "Development"
	@echo
	@echo "${YELLOW}make rubocop-fix${NC}  run rubocop -A"
	@echo
	@echo "Deployment"
	@echo
	@echo "${YELLOW}make deploy${NC}       deploy to heroku"
	@echo
