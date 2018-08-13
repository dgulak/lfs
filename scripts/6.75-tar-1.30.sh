#!/bin/bash

# 6.75. Tar-1.30 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/tar.html

FORCE_UNSAFE_CONFIGURE=1  \
_configure --prefix=/usr \
            --bindir=/bin

_make
_make_check

_exec '
make install &&
make -C doc install-html docdir=/usr/share/doc/tar-1.30
'
