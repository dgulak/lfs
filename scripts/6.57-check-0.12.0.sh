#!/bin/bash

# 6.57. Check-0.12.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/check.html

_configure --prefix=/usr
_make
_make_check
_make install
