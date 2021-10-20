FROM ubuntu:21.10 AS BASE

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update

RUN apt-get install -y \
        ca-certificates \
        devscripts \
        equivs \
        git \
        tpm2-tools \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /

COPY build-swtpm.sh .
RUN ./build-swtpm.sh

COPY start-swtpm.sh .

RUN mkdir swtpmdir
CMD /bin/bash

