#!/bin/bash
set -o errexit -o noglob -o nounset -o pipefail

wget https://jaist.dl.sourceforge.net/project/ibmswtpm2/ibmtpm1661.tar.gz
tar -xf ibmtpm1661.tar.gz
make -C ./src -j$(nproc)
make -C ./src install
