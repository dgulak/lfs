#!/bin/bash

# 5.23. Gawk-4.2.0  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/gawk.html
_configure --prefix=/tools
_make
_make check
_make install
