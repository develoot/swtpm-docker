#!/bin/bash
set -o errexit -o noglob -o nounset -o pipefail

readonly URL="https://github.com/stefanberger/swtpm"
git clone --depth 1 --branch "v0.6.1" "${URL}"
cd swtpm

apt install -y \
  autoconf \
  automake \
  build-essential \
  expect \
  gawk \
  gnutls-bin \
  gnutls-dev \
  libfuse-dev \
  libglib2.0-dev \
  libgmp-dev \
  libseccomp-dev \
  libssl-dev \
  libtasn1-dev \
  libtool \
  libjson-glib-dev \
  net-tools \
  python3-cryptography \
  python3-setuptools \
  python3-twisted \
  socat \
  softhsm2

./autogen.sh
make -j"$(nproc)"
make -j"$(nproc)" check
make install
