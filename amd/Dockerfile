FROM ubuntu:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget ocl-icd-opencl-dev ocl-icd-libopencl1 clinfo

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF -DWITH_OPENCL=ON -DWITH_CUDA=OFF \
    && make - j$(nproc)

WORKDIR /monero/xmrig/build
COPY ../run.sh .

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./run.sh"]



