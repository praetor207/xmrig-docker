FROM ubuntu:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget

RUN wget https://repo.radeon.com/amdgpu-install/23.40.1/ubuntu/jammy/amdgpu-install_6.0.60001-1_all.deb \
    && dpkg -i amdgpu-install_6.0.60001-1_all.deb \
    && apt-get update \
    && amdgpu-install --usecase=opencl --accept-eula

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF -DWITH_OPENCL=ON \
    && make -j$(nproc)

WORKDIR /monero/xmrig/build
COPY ../run.sh .

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./run.sh"]



