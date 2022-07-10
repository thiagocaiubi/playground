include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/plantuml:latest

.PHONY: diagrams
diagrams: ## Build the final diagrams
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it $(image) \
			/bin/sh /src/generate-diagrams.sh

.PHONY: image
image: ## Build the image
	docker build . -t $(image)

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /plantuml \
		--entrypoint /bin/sh \
		-it $(image)

