#!/bin/bash

# 6.21. Bzip2-1.0.6 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/bzip2.html
_exec '
    patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch &&
    sed -i "s@\(ln -s -f \)$(PREFIX)/bin/@\1@" Makefile &&
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
'

_make -f Makefile-libbz2_so
_make clean
_make
_make PREFIX=/usr install

_exec '
    cp -v bzip2-shared /bin/bzip2 &&
    cp -av libbz2.so* /lib &&
    ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so &&
    rm -v /usr/bin/{bunzip2,bzcat,bzip2} &&
    ln -sv bzip2 /bin/bunzip2 &&
    ln -sv bzip2 /bin/bzcat
'
