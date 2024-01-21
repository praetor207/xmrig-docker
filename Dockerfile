FROM ubuntu:latest


RUN apt update
RUN apt upgrade -y
RUN apt install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF \
    && make

# Set up entry point to run xmrig
WORKDIR /monero/xmrig/build
COPY mine.sh .
ENTRYPOINT ["./mine.sh"]