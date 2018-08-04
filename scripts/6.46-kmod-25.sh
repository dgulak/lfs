#!/bin/bash

# 6.46. Kmod-25 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/kmod.html

_configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zlib

_make
_make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  _exec "ln -sfv ../bin/kmod /sbin/$target"
done

_exec 'ln -sfv kmod /bin/lsmod'
