#!/bin/bash

# 6.62. GRUB-2.02
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/grub.html

_configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-werror
            #--disable-efiemu       \
_make
_make install
