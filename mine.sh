#!/bin/sh

docker run -it \
    --name monero_miner \
    -v monero_data:/monero \
    praetor242/xmrig:latest \
    --coin monero \
    -o stratum+tcp://xmr-us-east1.nanopool.org:10300 \
    -u 44H4DPKj9PQ7XWLprDVBhzEbyEZMcw4XsZRkt9FatqY12SejeRKGj4Acquh3jhbFNZLGgJvZh5Qig3gfzqKDx4RKQJ7ooNU \
    -p M@ck3y242

