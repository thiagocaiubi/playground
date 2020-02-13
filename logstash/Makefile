include ../make-help/Makefile

logstash-version?=7.5.1

.PHONY: logstash-server
logstash-server: ## Run logstash server
	docker run \
		--rm \
		-p 8080:8080 \
		-v $(shell pwd):/src \
		-w /src \
		-it docker.elastic.co/logstash/logstash:${logstash-version} \
			--path.settings /src

.PHONY: shell
shell: ## Start interactive shell session inside the container
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it docker.elastic.co/logstash/logstash:${logstash-version} \
			/bin/bash
