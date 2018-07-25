#!/bin/bash

# 6.14. M4-1.4.18
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/m4.html

_configure --prefix=/usr
_make
_make_check
_make install
