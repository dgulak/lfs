#!/bin/bash

# 5.31. Tar-1.30 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/tar.html
_configure --prefix=/tools
_make
_make_check
_make install
