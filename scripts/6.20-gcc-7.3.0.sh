#!/bin/bash

# 6.20. GCC-7.3.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gcc.html

case $(uname -m) in
  x86_64)
    _exec sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac

_exec \
    rm -f /usr/lib/gcc

_exec ' 
    ls -l &&
    mkdir -v build &&
    cd build 
'

SED=sed                              \
__configure --prefix=/usr            \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib

_make

_exec ulimit -s 32768
_make_check -k

# See how many tests failed...
_echo_info "Check gcc tests. This is crucial. Then enter any key to continue or CTRL + C to stop"
read a


_make install
_exec '
    ln -sv ../usr/bin/cpp /lib &&
    ln -sv gcc /usr/bin/cc &&
    install -v -dm755 /usr/lib/bfd-plugins &&
    ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/7.3.0/liblto_plugin.so /usr/lib/bfd-plugins/ 
'

# Again manual intervention needed
_echo_info "Check all necessary stuff from the remainings of the chapter 6.20 (correctness of gcc). Press any key to continue or cancel with CTRL+C"
read a

_exec '
    mkdir -pv /usr/share/gdb/auto-load/usr/lib &&
    mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
'
