# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  License    : Apache version 2
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

export PATH_WORKSPACE="src"
export PATH_DOCKER="docker"
export PROJECT_NAME="k8s-calculator"

export CI_REGISTRY     ?= hub.docker.com
export CI_PROJECT_PATH ?= zeroc0d3

IMAGE          = $(CI_REGISTRY)/${CI_PROJECT_PATH}/k8s-calculator
DIR            = $(shell pwd)
VERSION       ?= 1.3.0

BASE_IMAGE     = alpine
BASE_VERSION   = 3.13

.PHONY: run stop remove build push push-container
run:
	@echo "============================================"
	@echo " Task      : Running Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@./run-docker.sh
	@echo '- DONE -'

stop:
	@echo "============================================"
	@echo " Task      : Stopping Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@docker-compose -f ${PATH_DOCKER}/app-compose.yml stop
	@echo '- DONE -'

remove:
	@echo "============================================"
	@echo " Task      : Remove Docker Container "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@docker-compose -f ${PATH_DOCKER}/app-compose.yml down
	@echo '- DONE -'

build:
	@echo "============================================"
	@echo " Task      : Create Docker Image "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-build.sh
	@echo '- DONE -'

push:
	@echo "============================================"
	@echo " Task      : Push Docker Image "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-push.sh
	@echo '- DONE -'

push-container:
	@echo "============================================"
	@echo " Task      : Push Docker Hub "
	@echo " Date/Time : `date`"
	@echo "============================================"
	@cd ${PATH_DOCKER} && ./docker-build.sh
	@cd ${PATH_DOCKER} && ./docker-push.sh
	@echo '- DONE -'
