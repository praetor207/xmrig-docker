# Use an official Nvidia runtime base image
FROM nvidia/cuda:11.1-base

WORKDIR /monero

RUN apt-get update && \
    apt-get install -y \
        cmake \
        git \
        build-essential \
        libuv1-dev \
        libmicrohttpd-dev \
        libssl-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --single-branch --depth 1 https://github.com/xmrig/xmrig.git .

RUN mkdir build && cd build && \
    cmake .. -DCUDA_ARCH=61 && \
    make -j$(nproc)

ENTRYPOINT ["xmrig"]
