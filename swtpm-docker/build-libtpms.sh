#!/bin/bash
set -o errexit -o noglob -o nounset -o pipefail

readonly URL="https://github.com/stefanberger/libtpms.git"
git clone --depth 1 --branch "v0.9.0" "${URL}"
cd libtpms

mk-build-deps \
  --install \
  --build-dep \
  --tool="apt-get --no-install-recommends -y" \
  ./debian/control

./autogen.sh --with-tpm2 --with-openssl
make -j"$(nproc)"
make -j"$(nproc)" check
make install

