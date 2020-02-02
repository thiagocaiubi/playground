include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/aws:latest

.PHONY: image
image: ## Build the image
	docker build . -t $(image)

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		-e AWS_ACCESS_KEY_ID \
		-e AWS_SECRET_ACCESS_KEY \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it $(image) \
			/bin/bash
