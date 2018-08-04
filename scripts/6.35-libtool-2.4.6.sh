#!/bin/bash

# 6.35. Libtool-2.4.6  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/libtool.html

_configure --prefix=/usr
_make
# 5 tests can fail in LFS. 
_make_check TESTSUITEFLAGS=-j4
_make install
