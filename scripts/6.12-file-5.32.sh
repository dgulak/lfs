#!/bin/bash

# 6.12. File-5.32 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/file.html
_configure --prefix=/usr
_make
_make check
_make install
