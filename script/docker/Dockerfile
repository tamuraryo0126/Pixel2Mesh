FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
MAINTAINER Tamura Ryo <tamura.ryo@vss.it.aoyama.ac.jp>

# apt-get
ENV DEBCONF_NOWARNINGS=yes
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo \
    git \
    tmux 

# anaconda
ENV PYTHON_VERSION=3 \
    ANACONDA_VERSION=5.2.0 \
    ANACONDA_ROOT=/usr/local/anaconda \
    PATH=$PATH:/root/anaconda${PYTHON_VERSION}/bin
RUN cd /tmp && \
    apt-get install -y wget && \
    wget https://repo.continuum.io/archive/Anaconda${PYTHON_VERSION}-${ANACONDA_VERSION}-Linux-x86_64.sh && \
    chmod +x Anaconda${PYTHON_VERSION}-${ANACONDA_VERSION}-Linux-x86_64.sh && \
    ./Anaconda${PYTHON_VERSION}-${ANACONDA_VERSION}-Linux-x86_64.sh -b -p ${ANACONDA_ROOT} && \
    rm -rf *

RUN ln -s ${ANACONDA_ROOT}/bin/python /usr/local/bin/python && \
    ln -s ${ANACONDA_ROOT}/bin/pip /usr/local/bin/pip

# clean
RUN apt-get clean -y && \
    apt-get autoremove -y && \
    apt-get update -y && \
    apt-get upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# requirements
RUN pip install -U pip && \
    pip install --ignore-installed -U \
    torch==1.1.0 \
    scikit-image==0.15.0 \
    scipy==1.3.1 \
    opencv-python==4.1.1.26 \
    opencv-contrib-python==4.1.1.26

WORKDIR /root
