FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget

WORKDIR /monero

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb \
    && dpkg -i cuda-keyring_1.1-1_all.deb \
    && apt-get update \
    && apt-get install -y cuda cuda-toolkit-12-3

RUN git clone https://github.com/xmrig/xmrig-cuda.git \
    && mkdir xmrig-cuda/build \
    && cd xmrig-cuda/build \
    && cmake .. -DCUDA_ARCH=61 -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
    && make -j$(nproc)

RUN git clone --single-branch --depth 1 https://github.com/xmrig/xmrig.git \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. \
    && make -j$(nproc)

WORKDIR /monero/xmrig/build

RUN cp /monero/xmrig-cuda/build/libxmrig-cuda.so .

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh .
ENTRYPOINT ["./run.sh"]


