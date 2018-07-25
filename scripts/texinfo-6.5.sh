#!/bin/bash

# 5.32. Texinfo-6.5 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/texinfo.html
_configure --prefix=/tools
_make
_make_check
_make install
