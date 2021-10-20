FROM ubuntu:21.10 AS BASE

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update \
    && apt-get install -y ca-certificates \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /

COPY build-swtpm.sh .
RUN ./build-swtpm.sh

COPY start-swtpm.sh .

RUN mkdir swtpmdir
CMD /bin/bash

