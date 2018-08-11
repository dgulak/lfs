#!/bin/bash

# 6.64. Gzip-1.9 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gzip.html

_configure --prefix=/usr
_make
_make_check
_make install
_exec 'mv -v /usr/bin/gzip /bin'
