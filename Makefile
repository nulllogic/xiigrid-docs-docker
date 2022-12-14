include .env

.PHONY: help docs-build docs-watch

CURRENT_DIR := $(shell pwd)

help:
	@echo "[ENV SETUP]"

docs-build:
	@echo "[Building Docker image]"
	docker build -t xiigrid-docs .

docs-watch:
	@echo "[Running Docker XII/Grid docs]"
	docker run --rm -it -v ${CURRENT_DIR}/src:/app/src -v ${XIIGRID_DIR}/scss:/app/src/styles -v ${XIIGRID_DIR}/docs:/app/data/docs -p 3000:3000 xiigrid-docs
