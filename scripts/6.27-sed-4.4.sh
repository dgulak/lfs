#!/bin/bash

# 6.27. Sed-4.4 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/sed.html

_exec "
sed -i 's/usr/tools/'                 build-aux/help2man &&
sed -i 's/testsuite.panic-tests.sh//' Makefile.in
"

_configure --prefix=/usr --bindir=/bin
_make
_make html
_make_check
_make install

_exec '
install -d -m755           /usr/share/doc/sed-4.4 &&
install -m644 doc/sed.html /usr/share/doc/sed-4.4
'
