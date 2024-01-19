#!/bin/sh

docker run -it \
    --name monero_miner \
    -v /home/wfisher/monero:/monero \
    praetor242/xmrig:latest \
    --coin monero \
    -o stratum+tcp://xmr-us-east1.nanopool.org:10300 \
    -u 49J59fZzo19PcK1v2kqXuuBBQZStnvxzJbkGEfxVai9uD72bhuDwjAfQ8Df134xKc4LGWGvEQ8TLoaiQ7gDNcgpyEPcS8Hh \
    -p M@ck3y242

