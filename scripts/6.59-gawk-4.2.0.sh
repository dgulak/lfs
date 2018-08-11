#!/bin/bash

# 6.59. Gawk-4.2.0
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gawk.html

_exec 'sed -i "s/extras//" Makefile.in'
_configure --prefix=/usr
_make
_make_check
_make install
_exec '
mkdir -v /usr/share/doc/gawk-4.2.0 &&
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.0
'
