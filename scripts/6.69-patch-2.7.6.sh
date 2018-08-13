#!/bin/bash

# 6.69. Patch-2.7.6 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/patch.html

_configure --prefix=/usr      
_make
_make_check
_make install
