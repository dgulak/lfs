#!/bin/bash

# 5.25. Grep-3.1 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/grep.html
./configure --prefix=/tools
_make
_make check
_make install
