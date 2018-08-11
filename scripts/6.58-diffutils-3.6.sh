#!/bin/bash

# 6.58. Diffutils-3.6
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/diffutils.html

_configure --prefix=/usr
_make
_make_check
_make install
