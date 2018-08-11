#!/bin/bash

# 6.66. Kbd-2.0.4 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/kbd.html

_exec '
patch -Np1 -i ../kbd-2.0.4-backspace-1.patch &&
sed -i '"'"'s/\(RESIZECONS_PROGS=\)yes/\1no/g'"'"' configure &&
sed -i '"'"'s/resizecons.8 //'"'"' docs/man/man8/Makefile.in
'

PKG_CONFIG_PATH=/tools/lib/pkgconfig \
    _configure --prefix=/usr --disable-vlock

_make
_make_check
_make install
_exec '
mkdir -v       /usr/share/doc/kbd-2.0.4 &&
cp -R -v docs/doc/* /usr/share/doc/kbd-2.0.4
'
