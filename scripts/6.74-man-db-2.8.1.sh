#!/bin/bash

# 6.74. Man-DB-2.8.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/man-db.html
_configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.1 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap            \
            --with-systemdtmpfilesdir=

_make
_make_check
_make install
