#!/bin/sh

docker container rm monero_miner

docker run -it \
    --name monero_miner \
    -v monero_data:/monero \
    praetor242/xmrig:latest
