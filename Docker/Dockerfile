# FROM ubuntu:20.04
FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 必要そうなものをinstall
RUN apt-get update && apt-get install -y \
--no-install-recommends wget build-essential libreadline-dev \ 
libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev \
liblzma-dev zlib1g-dev uuid-dev libffi-dev libdb-dev

# RUN wget --no-check-certificate https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz \
# && tar -xf Python-3.9.5.tgz \
# && cd Python-3.9.5 \
# && ./configure --enable-optimizations\
# && make \
# && make install

RUN apt-get update && apt-get install -y \
    git \
    locales \
    xterm \
    dbus-x11 \
    terminator \
    sudo \
    unzip \
    lsb-release \
    curl \
    net-tools \
    software-properties-common \
    subversion \
    libssl-dev \
    htop \
    gedit \
    gdb \
    valgrind \
    build-essential \
    bash-completion \
    python3-pip \
    vim \
    cmake \
    wget \
    python3 \
    python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/list*

RUN pip3 install numpy scipy matplotlib pandas 

RUN pip3 install torch torchvision torchaudio 


#必要なpythonパッケージをpipでインストール
#RUN pip3 install --upgrade pip && pip3 install --no-cache-dir jupyterlab

#requirements.txtなら以下のように
#RUN pip3 install -r ./requirements.txt