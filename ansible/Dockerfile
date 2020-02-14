FROM ubuntu:18.04

ENV ANSIBLE_VERSION 2.9.5

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        ca-certificates \
        curl \
        python3 \
        python3-distutils \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

RUN pip3 install --upgrade \
    ansible==${ANSIBLE_VERSION}
