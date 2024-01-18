FROM ubuntu:23.10

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev

RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git /xmrig \
    && mkdir /xmrig/build \
    && cd /xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF \
    && make

# Set up entry point to run xmrig
WORKDIR /xmrig/build
ENTRYPOINT ["./xmrig"