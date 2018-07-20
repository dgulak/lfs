#!/bin/bash

# 5.28. Patch-2.7.6 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/patch.html
_configure --prefix=/tools
_make
_make check
_make install
