FROM ubuntu:latest

RUN apt update \
    && apt upgrade -y \
    && apt install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget

RUN wget https://repo.radeon.com/amdgpu-install/6.0/ubuntu/jammy/amdgpu-install_6.0.60000-1_all.deb \
    && dpkg -i amdgpu-install_6.0.60000-1_all.deb \
    && apt-get update \
    && apt-get -y install ocl-icd-opencl-dev ocl-icd-libopencl1 clinfo

RUN amdgpu-install --no-32 --usecase=opencl,rocm,hip --accept-eula

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF -DWITH_OPENCL=ON -DWITH_CUDA=OFF \
    && make

WORKDIR /monero/xmrig/build
COPY ../run.sh .

RUN apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["./run.sh"]



