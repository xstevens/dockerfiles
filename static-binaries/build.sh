#!/usr/bin/env bash

set -eux

wget https://curl.haxx.se/download/curl-7.64.1.tar.gz && \
    tar xzvf curl-7.64.1.tar.gz && \
    cd curl-7.64.1 && \
    ./configure --with-ssl --disable-shared --with-nghttp2 && \
    make LDFLAGS=-all-static && \
    cp src/curl /output/

