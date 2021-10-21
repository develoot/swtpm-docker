#!/bin/bash

set -o errexit
set -o noglob
set -o nounset
set -o pipefail

readonly URL="https://github.com/stefanberger/swtpm"

git clone "${URL}"; cd swtpm
git checkout "v0.6.1"

mk-build-deps \
  --install \
  --build-dep \
  '--tool=apt-get --no-install-recommends -y' \
  ./debian/control

./autogen.sh --prefix="/usr"

make -j"$(nproc)"
make -j"$(nproc)" check
make install

