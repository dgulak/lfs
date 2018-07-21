#!/bin/bash

# 6.11. Zlib-1.2.11 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/zlib.html

./configure --prefix=/usr
_make
_make check
_make install

set +x
mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so
set -x
