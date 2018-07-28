#!/bin/bash

# 6.31. Bison-3.0.4 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/bison.html
_configure --prefix=/usr --docdir=/usr/share/doc/bison-3.0.4
_make
_make install
