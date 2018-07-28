#!/bin/bash

# 6.23. Ncurses-6.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/ncurses.html

_exec '
    sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in 
'

_configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec

_make
_make install

_exec '
    mv -v /usr/lib/libncursesw.so.6* /lib &&
    ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so 
'

for lib in ncurses form panel menu ; do
    _exec '
    rm -vf                    /usr/lib/lib${lib}.so &&
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so &&
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
    '
done

_exec '
    rm -vf                     /usr/lib/libcursesw.so &&
    echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so &&
    ln -sfv libncurses.so      /usr/lib/libcurses.so &&
    mkdir -v       /usr/share/doc/ncurses-6.1 &&
    cp -v -R doc/* /usr/share/doc/ncurses-6.1
'


