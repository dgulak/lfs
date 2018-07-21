#!/bin/bash

# 6.7. Linux-4.15.3 API Headers 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/linux-headers.html

make mrproper

make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include

