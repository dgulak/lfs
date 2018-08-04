#!/bin/bash

# 6.45. Xz-5.2.3  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/xz.html

_configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.3

_make
_make_check
_make install

_exec '
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin &&
mv -v /usr/lib/liblzma.so.* /lib &&
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so
'
