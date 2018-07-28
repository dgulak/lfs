#!/bin/bash

# 6.36. GDBM-1.14.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gdbm.html

_configure --prefix=/usr \
            --disable-static \
            --enable-libgdbm-compat
_make
_make_check
_make install


