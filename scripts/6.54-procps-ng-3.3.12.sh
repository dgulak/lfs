#!/bin/bash

# 6.54. Procps-ng-3.3.12
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/procps-ng.html

_configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.12 \
            --disable-static                         \
            --disable-kill

_make

_exec '
sed -i -r '"'"'s|(pmap_initname)\\\$|\1|'"'"' testsuite/pmap.test/pmap.exp &7
sed -i '"'"'/set tty/d'"'"' testsuite/pkill.test/pkill.exp &&
rm testsuite/pgrep.test/pgrep.exp
'
_make_check

_make install
_exec '
mv -v /usr/lib/libprocps.so.* /lib &&
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
'
