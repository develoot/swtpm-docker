#!/bin/bash

set -o errexit -o nounset -o noglob -o pipefail

readonly URL='https://github.com/stefanberger/swtpm'

apt-get install -y \
  automake \
  autoconf \
  bash \
  coreutils \
  expect \
  libtool \
  sed \
  libtpms \
  libtpms-devel \
  fuse \
  fuse-devel \
  glib2 \
  glib2-devel \
  json-glib-devel \
  net-tools \
  python3 \
  python3-twisted \
  selinux-policy-devel \
  socat \
  trousers \
  gnutls \
  gnutls-devel \
  libtasn1 \
  libtasn1-tools \
  libtasn1-devel

git clone "${URL}"
cd swtpm
git checkout "v0.6.1"
./autogen.sh --prefix=/usr
make -j"$(nproc)"
make check
make install

