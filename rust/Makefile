include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/rust:latest

.PHONY: dev
dev: ## Run development mode
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it $(image) \
			cargo run

.PHONY: fmt
fmt: ## Format rust code
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it $(image) \
			cargo fmt

.PHONY: image
image: ## Build the image
	docker build . -t $(image)

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it $(image) \
			/bin/bash
