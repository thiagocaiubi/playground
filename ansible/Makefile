include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/ansible:latest

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
