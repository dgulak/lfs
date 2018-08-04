#!/bin/bash

# 6.43. Autoconf-2.69  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/autoconf.html

_configure --prefix=/usr
_make
_make_check TESTSUITEFLAGS=-j4
# _make install
