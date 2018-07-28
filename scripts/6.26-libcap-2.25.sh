#!/bin/bash

# 6.26. Libcap-2.25 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/libcap.html

_exec "sed -i '/install.*STALIBNAME/d' libcap/Makefile"

_make
_make RAISE_SETFCAP=no lib=lib prefix=/usr install

_exec '
chmod -v 755 /usr/lib/libcap.so &&
mv -v /usr/lib/libcap.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so
'


