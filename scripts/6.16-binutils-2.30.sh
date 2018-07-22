#!/bin/bash

# 6.16. Binutils-2.30
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/binutils.html

# make sure that pty works
EXPECTED="spawn ls"
SPAWN_RESULT=`expect -c "${EXPECTED}"`
[ "${SPAWN_RESULT:0:8}" == "${EXPECTED}" ] || ( _echo_err "Can't build binutils. Check pty problem." ; exit)

__configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib

_make tooldir=/usr
_make -k check
_make tooldir=/usr install
