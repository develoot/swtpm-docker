#!/bin/bash

set -o errexit
set -o noglob
set -o nounset
set -o pipefail

readonly URL="https://github.com/tpm2-software/tpm2-tools"

git clone "${URL}"; cd tpm2-tools
git checkout "5.1.X"

apt-get install --no-install-recommends -y \
  autoconf \
  automake \
  libtool \
  libcurl4-openssl-dev \
  libssl-dev \
  libtss2-dev \
  pandoc \
  pkg-config \
  uuid-dev

./bootstrap
./configure
make -j"$(nproc)"
make install

