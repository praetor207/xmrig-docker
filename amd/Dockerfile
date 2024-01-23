FROM ubuntu:latest

RUN wget https://repo.radeon.com/amdgpu-install/6.0/ubuntu/jammy/amdgpu-install_6.0.60000-1_all.deb
RUN dpkg -i amdgpu-install_6.0.60000-1_all.deb
RUN apt-get update 

RUN apt update \
    && apt upgrade -y \
    && apt install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev ocl-icd-opencl-dev wget

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF -DWITH_OPENCL=ON \
    && make

WORKDIR /monero/xmrig/build
COPY ../run.sh .

ENTRYPOINT ["./run.sh"]

# Cleanup
RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
