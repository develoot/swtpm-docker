#!/bin/bash

docker run --rm -it -p 2321:2321 -p 2322:2322 --name tpm-emulator tpm-emulator
