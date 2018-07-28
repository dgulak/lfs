#!/bin/bash

# 6.42. Intltool-0.51.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/intltool.html

cmd='sed -i '"'"'s:\\\${:\\\$\\{:'"'"' intltool-update.in'
echo "$cmd"
sed -i 's:\\\${:\\\$\\{:' intltool-update.in

_configure --prefix=/usr
_make
_make_check
_make install
_exec install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

