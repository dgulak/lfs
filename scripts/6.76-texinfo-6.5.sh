#!/bin/bash

# 6.76. Texinfo-6.5 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/texinfo.html

_configure --prefix=/usr --disable-static
_make
_make_check
_make install
_make TEXMF=/usr/share/texmf install-tex
