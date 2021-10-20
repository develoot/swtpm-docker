FROM ubuntu:21.10

ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update
RUN apt-get install -y ca-certificates
RUN apt-get install -y devscripts
RUN apt-get install -y equivs
RUN apt-get install -y git
RUN apt-get install -y tpm2-tools
RUN apt-get install -y vim

WORKDIR /
COPY build-swtpm.sh .
RUN ./build-swtpm.sh
RUN rm ./build-swtpm.sh

WORKDIR /workspace
RUN mkdir bin
RUN mkdir swtpmdir
COPY swtpm-start ./bin/swtpm-start
COPY swtpm-clear ./bin/swtpm-clear
COPY setenv.sh   ./bin/setenv.sh

RUN echo "source /workspace/bin/setenv.sh" >> ~/.bashrc
CMD /bin/bash

