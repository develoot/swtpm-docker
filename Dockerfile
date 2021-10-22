FROM ubuntu:21.10

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update
RUN apt-get install --no-install-recommends -y ca-certificates
RUN apt-get install --no-install-recommends -y devscripts
RUN apt-get install --no-install-recommends -y equivs
RUN apt-get install --no-install-recommends -y git
RUN apt-get install --no-install-recommends -y python3-pip
RUN apt-get install --no-install-recommends -y vim

WORKDIR /

COPY build-libtpms.sh .
RUN ./build-libtpms.sh
RUN rm ./build-libtpms.sh

COPY build-swtpm.sh .
RUN ./build-swtpm.sh
RUN rm ./build-swtpm.sh

COPY build-tpm2-tools.sh .
RUN ./build-tpm2-tools.sh
RUN rm ./build-tpm2-tools.sh

WORKDIR /workspace

RUN mkdir bin
RUN mkdir swtpmdir
COPY swtpm-start ./bin/swtpm-start
COPY swtpm-clear ./bin/swtpm-clear
COPY setenv.sh ./bin/setenv.sh

RUN echo "source /workspace/bin/setenv.sh" >> ~/.bashrc

CMD /bin/bash

