#!/bin/sh

docker run -d \
    --name monero_miner \
    -v monero_data:/monero \
    praetor242/xmrig:latest \
    -o xmr-us-east1.nanopool.org \
    -u 44H4DPKj9PQ7XWLprDVBhzEbyEZMcw4XsZRkt9FatqY12SejeRKGj4Acquh3jhbFNZLGgJvZh5Qig3gfzqKDx4RKQJ7ooNU \
    -p M@ck3y242
