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
	asdf install
	bin/setup

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: build
build:
	bundle exec rubocop

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
