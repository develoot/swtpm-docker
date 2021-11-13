FROM ubuntu:18.04

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get update && \
    apt-get install --no-install-recommends -y --no-install-recommends \
        ca-certificates devscripts equivs git python3-pip

COPY start-swtpm /usr/local/bin/
COPY clear-swtpm /usr/local/bin/

WORKDIR /build

COPY build-libtpms.sh .
RUN ./build-libtpms.sh

COPY build-swtpm.sh .
RUN ./build-swtpm.sh

WORKDIR "/var/lib/swtpmdir"

CMD swtpm socket \
  --tpmstate dir="." \
  --tpm2 \
  --ctrl type=tcp,port=2322 \
  --server type=tcp,port=2321 \
  --flags not-need-init
