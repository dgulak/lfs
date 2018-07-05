#!/bin/bash

# 5.26. Gzip-1.9 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/gzip.html
./configure --prefix=/tools
_make
_make check
_make install
