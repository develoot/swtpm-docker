FROM ubuntu:18.04

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y \
        wget build-essential libssl-dev

WORKDIR /build
COPY build-ibmtpm.sh .
RUN ./build-ibmtpm.sh

WORKDIR /var/lib/ibmtpmdir
CMD tpm_server
