#!/bin/bash

set -o errexit -o nounset -o noglob -o pipefail

readonly URL='https://github.com/stefanberger/swtpm'

# sudo apt install -y \
#   autoconf \
#   automake \
#   bash \
#   build-essential \
#   coreutils \
#   devscripts \
#   equivs \
#   expect \
#   fuse \
#   fuse-devel \
#   glib2 \
#   glib2-devel \
#   gnutls \
#   gnutls-devel \
#   json-glib-devel \
#   libtasn1 \
#   libtasn1-devel \
#   libtasn1-tools \
#   libtool \
#   libtpms \
#   libtpms-devel \
#   net-tools \
#   python3 \
#   python3-twisted \
#   sed \
#   selinux-policy-devel \
#   socat \
#   trousers

git clone "${URL}"
cd swtpm; git checkout "v0.6.1"
sudo mk-build-deps --install ./debian/control
./autogen.sh --prefix=/usr
make -j"$(nproc)"
make check
sudo make install

