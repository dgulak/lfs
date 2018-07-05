FROM debian

WORKDIR /home/work

RUN apt-get update && \
    apt-get install -y \
        bison \
        texinfo \
        gawk \
        binutils \
        g++ \
        xz-utils \
        patch \
        make \
        m4 \
        bzip2 \
        vim \
        ssh \
        gdb \
        zsh && \
    ln -sf /bin/sh /bin/bash

