#!/bin/bash

# 6.44. Automake-1.15.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/automake.html

_configure --prefix=/usr \
           --docdir=/usr/share/doc/automake-1.15.1

_make

_exec 'sed -i "s:./configure:LEXLIB=/usr/lib/libfl.a &:" t/lex-{clean,depend}-cxx.sh'
_make_check
#_make install
