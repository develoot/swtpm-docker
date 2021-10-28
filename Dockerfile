FROM ubuntu:20.04

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        ca-certificates \
        devscripts \
        equivs \
        git \
        python3-pip \
        vim

WORKDIR /build

COPY build-libtpms.sh .
RUN ./build-libtpms.sh

COPY build-swtpm.sh .
RUN ./build-swtpm.sh

COPY build-tpm2-tools.sh .
RUN ./build-tpm2-tools.sh

WORKDIR /workspace

RUN mkdir bin
COPY start-swtpm ./bin/start-swtpm
COPY clear-swtpm ./bin/clear-swtpm
COPY setenv.sh ./bin/setenv.sh

RUN echo -e "\nsource /workspace/bin/setenv.sh" >> ~/.bashrc

CMD /bin/bash

