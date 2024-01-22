FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt upgrade -y
RUN apt install -y git libhwloc-dev build-essential cmake libuv1-dev libssl-dev wget

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
RUN dpkg -i cuda-keyring_1.1-1_all.deb

RUN apt-get update
RUN apt-get install -y cuda  

WORKDIR /monero/xmrig/build
COPY run.sh .

ENTRYPOINT ["/bin/sh"]