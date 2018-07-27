#!/bin/bash

# 6.19. MPC-1.1.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/mpc.html

_configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.1.0
_make
_make html
_make_check
_make install
_make install-html
