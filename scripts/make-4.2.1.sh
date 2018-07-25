#!/bin/bash

# 5.27. Make-4.2.1 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/make.html
_exec sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
_configure --prefix=/tools --without-guile
_make
# Check is commented due to the runtime error. perl cannot find one of the files.
# To run the check manually cd to tests and:
# PERLLIB=$PWD perl ./run_make_tests.pl -srcdir $PWD/..  -make ../make
# _make_check
_make install

