FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget
RUN apt-get upgrade -y

WORKDIR /monero
RUN git clone --single-branch -b master --depth 1 https://github.com/xmrig/xmrig.git xmrig \
    && mkdir /monero/xmrig/build \
    && cd /monero/xmrig/build \
    && cmake .. -DWITH_HTTPD=OFF \
    && make

WORKDIR /monero/xmrig/build
COPY run.sh .

ENTRYPOINT ["./run.sh"]