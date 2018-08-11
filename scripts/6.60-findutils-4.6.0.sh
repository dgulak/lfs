#!/bin/bash

# 6.60. Findutils-4.6.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/findutils.html

_exec "sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in"
_configure --prefix=/usr --localstatedir=/var/lib/locate
_make
_make_check
_make install
_exec '
mv -v /usr/bin/find /bin &&
sed -i '"'"'s|find:=${BINDIR}|find:=/bin|'"'"' /usr/bin/updatedb
'
