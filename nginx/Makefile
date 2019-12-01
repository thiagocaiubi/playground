include ../make-help/Makefile

image=nginx:stable-alpine

.PHONY: nginx-server
nginx-server: ## Run nginx server
	docker run \
		--rm \
		-p 8080:80 \
		-v $(shell pwd)/etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
		-v $(shell pwd)/etc/nginx/conf.d:/etc/nginx/conf.d:ro \
		-it $(image)

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-v $(shell pwd)/etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
		-v $(shell pwd)/etc/nginx/conf.d:/etc/nginx/conf.d:ro \
		-it nginx:stable-alpine \
			/bin/sh
