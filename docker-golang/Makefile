include ../make-help/Makefile

image=golang:1.17

.PHONY: server
server: ## Run golang server
	docker run \
		--rm \
		-p 8080:8080 \
		-v $(shell pwd):/go/src/app \
		-w /go/src/app \
		-it $(image) \
			go run main.go

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-p 8080:8080 \
		-v $(shell pwd):/go/src/app \
		-w /go/src/app \
		-it $(image) \
			/bin/sh

.PHONY: test
test: ## Run tests
	docker run \
		--rm \
		-p 8080:8080 \
		-v $(shell pwd):/go/src/app \
		-w /go/src/app \
		-it $(image) \
			go test -v ./...
