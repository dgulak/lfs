#!/bin/bash

# 6.65. IPRoute2-4.15.0  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/iproute2.html
_exec '
sed -i /ARPD/d Makefile &&
rm -fv man/man8/arpd.8 &&
sed -i '"'"'s/m_ipt.o//'"'"' tc/Makefile
'

_make
DOCDIR=/usr/share/doc/iproute2-4.15.0 _make install


