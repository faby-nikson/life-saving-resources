.SILENT: help

SOURCE_DIR=$(shell pwd)
SCRIPTS_DIR=${SOURCE_DIR}/src

## Colors
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_COMMENT = \033[36m
COLOR_ERROR   = \033[31m
COLOR_WARNING = \033[33m

default: help

## Help
help:
	printf "${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	printf " make [target]\n\n"
	printf "${COLOR_COMMENT}Available targets:${COLOR_RESET}\n"
	awk '/^[a-zA-Z\-\_0-9\.@]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf " ${COLOR_INFO}%-26s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

define printSection
	@printf "\033[36m\n==================================================\n\033[0m"
	@printf "\033[36m $1 \033[0m"
	@printf "\033[36m\n==================================================\n\033[0m"
endef

.PHONY: install
## Run install: download and src useful components
install:
	$(call printSection,INSTALL)
	${SCRIPTS_DIR}/install.sh

.PHONY: config
## Setup configurations
config:
	$(call printSection,CONFIG)
	${SCRIPTS_DIR}/configurations.sh
