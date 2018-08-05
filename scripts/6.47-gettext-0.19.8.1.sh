#!/bin/bash

# 6.47. Gettext-0.19.8.1
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gettext.html

_exec "
sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in &&
sed -i 's/test-lock..EXEEXT.//' gettext-tools/gnulib-tests/Makefile.in
"

_configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.19.8.1

_make
_make_check
_make install
_exec '
chmod -v 0755 /usr/lib/preloadable_libintl.so
'
