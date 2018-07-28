#!/bin/bash

# 6.22. Pkg-config-0.29.2 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/pkg-config.html

_configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2
_make
_make_check
_make install
