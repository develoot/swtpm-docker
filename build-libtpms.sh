#!/bin/bash

set -o errexit
set -o noglob
set -o nounset
set -o pipefail

readonly URL="https://github.com/stefanberger/libtpms.git"

git clone "${URL}"; cd libtpms
git checkout "v0.9.0"

mk-build-deps \
  --install \
  --build-dep \
  --tool='apt-get --no-install-recommends -y' \
  ./debian/control

./autogen.sh --with-tpm2 --with-openssl
make -j"$(nproc)"
make -j"$(nproc)" check
make install

