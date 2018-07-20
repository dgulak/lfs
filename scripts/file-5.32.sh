#!/bin/bash

# 5.21. File-5.32 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/file.html
_configure --prefix=/tools
_make
_make check
_make install
