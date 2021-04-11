include ../make-default/Makefile
include ../make-help/Makefile

image=$(image_repo)/a0deploy:latest

.PHONY: image
image: ## Build the image
	docker build . -t $(image)

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-v $(shell pwd):/auth0 \
		-w /auth0 \
		-it $(image) \
		/bin/sh

.PHONY: export
export: ## Export auth0 tenant configuration in yaml format to current directory
	docker run \
		--rm \
		-v $(shell pwd):/auth0 \
		-w /auth0 \
		-it $(image) \
		a0deploy export --config_file config.json --format yaml --output_folder .

.PHONY: import
export: ## Import auth0 configuration in yaml format to current directory
	docker run \
		--rm \
		-v $(shell pwd):/auth0 \
		-w /auth0 \
		-it $(image) \
		a0deploy import --config_file config.json --input_file .
