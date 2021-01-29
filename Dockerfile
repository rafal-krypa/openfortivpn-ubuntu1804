FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y \
      wget \
      dpkg-dev \
      debhelper \
      autoconf \
      automake \
      libssl-dev \
      libsystemd-dev \
      pkg-config && \
    apt-get clean
