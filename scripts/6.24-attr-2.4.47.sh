#!/bin/bash

# 6.24. Attr-2.4.47
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/attr.html

_exec "
    sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in &&
    sed -i -e \"/SUBDIRS/s|man[25]||g\" man/Makefile &&
    sed -i 's:{(:\\\{(:' test/run
"
_configure --prefix=/usr \
            --bindir=/bin \
            --disable-static

_make
_make -j1 tests root-tests

_make install install-dev install-lib
_exec '
    chmod -v 755 /usr/lib/libattr.so &&
    mv -v /usr/lib/libattr.so.* /lib &&
    ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
'
