logstash-version?=7.3.2

.PHONY: logstash-server
logstash-server:
	docker run \
		--rm \
		-p 8080:8080 \
		-v $(shell pwd):/src \
		-w /src \
		-it docker.elastic.co/logstash/logstash:7.3.2 \
			--path.settings /src

.PHONY: shell
shell:
	docker run \
		--rm \
		-v $(shell pwd):/src \
		-w /src \
		-it docker.elastic.co/logstash/logstash:7.3.2 \
			/bin/bash

