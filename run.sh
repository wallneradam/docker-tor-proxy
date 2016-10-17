#!/bin/bash

docker run --rm -ti --name tor \
    --rm \
    -e IP_CHANGE_INTERVAL=30 \
    -p 8888:8888 \
    pickapp/tor-proxy:0.2.8.8
