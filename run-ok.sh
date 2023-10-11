#!/bin/bash

/usr/bin/docker run -it --net=host -v .:/build -w /build ghcr.io/rust-cross/manylinux2014-cross:aarch64 ./compile.sh true
