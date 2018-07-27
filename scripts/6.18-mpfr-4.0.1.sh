#!/bin/bash

# 6.18. MPFR-4.0.1
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/mpfr.html

_configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.0.1

_make
_make html

_make_check

_make install
_make install-html
