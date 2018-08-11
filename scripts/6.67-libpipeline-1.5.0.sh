#!/bin/bash

# 6.67. Libpipeline-1.5.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/libpipeline.html

_configure --prefix=/usr
_make
_make_check
_make install
