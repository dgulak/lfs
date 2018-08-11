#!/bin/bash

# 6.55. E2fsprogs-1.43.9  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/e2fsprogs.html

_exec 'mkdir -v build && cd build'

LIBS=-L/tools/lib                    \
CFLAGS=-I/tools/include              \
PKG_CONFIG_PATH=/tools/lib/pkgconfig \
__configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck

_make

_exec 'ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib'
LD_LIBRARY_PATH=/tools/lib _make_check

_make install
_make install-libs

_exec '
chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a &&
gunzip -v /usr/share/info/libext2fs.info.gz &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info &&
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo &&
install -v -m644 doc/com_err.info /usr/share/info &&
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
'



