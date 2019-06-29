FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tzdata && apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    fakeroot \
    g++ --no-install-recommends \
    gcc \
    gdb \
    git \
    java-common \
    libc6-dev \
    libisl15 \
    openjdk-11-jdk \
    make \
    libopencv-dev \
    python-all-dev \
    sudo \
    unzip \
    wget \
    zip \
  && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Install Raspbian9 toolchain
RUN curl -SL https://github.com/wpilibsuite/raspbian-toolchain/releases/download/v1.3.0/Raspbian9-Linux-Toolchain-6.3.0.tar.gz | sh -c 'mkdir -p /usr/local && cd /usr/local && tar xzf - --strip-components=1'

# Install Raspbian10 toolchain
RUN curl -SL https://github.com/wpilibsuite/raspbian-toolchain/releases/download/v2.0.0/Raspbian10-Linux-Toolchain-8.3.0.tar.gz | sh -c 'mkdir -p /usr/local && cd /usr/local && tar xzf - --strip-components=1'

WORKDIR /
