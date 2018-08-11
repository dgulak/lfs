#!/bin/bash

# 6.51. Python-3.6.4
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/Python.html

_configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes

_make
_make install
_exec '
chmod -v 755 /usr/lib/libpython3.6m.so &&
chmod -v 755 /usr/lib/libpython3.so
'

_exec '
install -v -dm755 /usr/share/doc/python-3.6.4/html &&

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.6.4/html \
    -xvf ../python-3.6.4-docs-html.tar.bz2
'

