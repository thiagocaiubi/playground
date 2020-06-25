include ../make-default/Makefile
include ../make-help/Makefile

base_image=$(image_repo)/base-image:latest
dist_image=$(image_repo)/dist-image:latest

.PHONY: base-image
base-image: ## Build the base-image
	docker build . -f Dockerfile.base -t $(base_image)

.PHONY: dist-image
dist-image: ## Build the dist-image
	docker build . -f Dockerfile.dist -t $(dist_image)

.PHONY: file-list
file-list: ## List files in dist image
	docker run --rm -it $(dist_image) ls -la /files
