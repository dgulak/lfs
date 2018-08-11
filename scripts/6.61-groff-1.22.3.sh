#!/bin/bash

# 6.61. Groff-1.22.3 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/groff.html

PAGE=A4 \
    _configure --prefix=/usr

_make -j1
_make install

