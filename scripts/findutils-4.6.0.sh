#!/bin/bash

# 5.22. Findutils-4.6.0
# http://www.linuxfromscratch.org/lfs/view/stable/chapter05/findutils.html
_configure --prefix=/tools
_make
_make_check
_make install
