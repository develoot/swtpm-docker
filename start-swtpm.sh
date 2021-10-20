#!/bin/bash

LD_LIBRARY_PATH=/usr/local/lib swtpm socket \
  --tpmstate dir=swtpmdir --tpm2 --ctrl type=tcp,port=2322 \
  --server type=tcp,port=2321 --flags not-need-init

