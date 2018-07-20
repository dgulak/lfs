#!/bin/bash

# 5.34. Xz-5.2.3 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/xz.html
_configure --prefix=/tools
_make
_make check
_make install
