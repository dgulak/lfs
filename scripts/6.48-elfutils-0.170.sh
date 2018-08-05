#!/bin/bash

# 6.48. Libelf 0.170  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/libelf.html

_configure --prefix=/usr
_make
# 1 test run-strip-nothing.sh fails and it's ok
_make_check
_make -C libelf install
_exec '
install -vm644 config/libelf.pc /usr/lib/pkgconfig
'
