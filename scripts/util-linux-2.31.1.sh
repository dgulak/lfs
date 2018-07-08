#!/bin/bash

# 5.33. Util-linux-2.31.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/util-linux.html
_configure --prefix=/tools                \
            --without-python               \
            --disable-makeinstall-chown    \
            --without-systemdsystemunitdir \
            --without-ncurses              \
            PKG_CONFIG=""
_make
_make install
