#!/bin/bash

set -o errexit -o nounset -o noglob -o pipefail

readonly URL='https://github.com/stefanberger/swtpm'

git clone "${URL}"
cd swtpm
git checkout "v0.6.1"
yes | mk-build-deps --install ./debian/control || :
./autogen.sh --prefix=/usr
make -j"$(nproc)"
make -j"$(nproc)" check
make install

