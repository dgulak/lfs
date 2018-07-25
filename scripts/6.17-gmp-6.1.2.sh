#!/bin/bash

# 6.17. GMP-6.1.2 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gmp.html
_configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.1.2

_make
_make html

make check 2>&1 | tee gmp-check-log

EXPECTED=190
PASSED=$(awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log) 

[ $PASSED == $EXPECTED ] || (_echo_err "Failed check: expected $EXPECTED tests to pass, but $PASSED actually passed" ; exit 1)

_make install
_make install-html

