#!/bin/bash
set -o errexit -o noglob -o nounset -o pipefail

readonly URL="https://github.com/tpm2-software/tpm2-tools.git"

git clone "${URL}"; cd swtpm
git checkout "v5.1.X"

apt install -y \
  autoconf \
  automake \
  build-essential \
  libcurl4-gnutls-dev \
  libssl-dev \
  libtool \
  libtss2-dev \
  pkg-config \
  python3-yaml \
  uuid-dev

./bootstrap
./configure
make -j"$(nproc)"
make install

