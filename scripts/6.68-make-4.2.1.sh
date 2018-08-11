#!/bin/bash

# 6.68. Make-4.2.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/make.html

_exec "sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c"
_configure --prefix=/usr
_make
PERL5LIB=$PWD/tests/ _make_check
_make install
