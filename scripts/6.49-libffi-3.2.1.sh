#!/bin/bash

# 6.49. Libffi-3.2.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/libffi.html

_exec "
sed -e '/^includesdir/ s/\$(libdir).*$/\$(includedir)/' \
    -i include/Makefile.in &&

sed -e '/^includedir/ s/=.*$/=@includedir@/' \
    -e 's/^Cflags: -I\${includedir}/Cflags:/' \
    -i libffi.pc.in
"

_configure --prefix=/usr --disable-static
_make
_make_check
_make install
