include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/diagrams:latest

.PHONY: diagrams
diagrams: ## Build the image
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		$(image) \
		/bin/bash ./scripts/diagrams.sh

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
