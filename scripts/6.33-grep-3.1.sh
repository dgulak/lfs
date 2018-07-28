#!/bin/bash

# 6.33. Grep-3.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/grep.html

_configure --prefix=/usr --bindir=/bin
_make
_make_check
_make install

