FROM ubuntu:23.10

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git libhwloc-dev build-essential cmake libuv1-dev libssl-dev