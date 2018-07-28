#!/bin/bash

# 6.29. Psmisc-23.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/psmisc.html

_configure --prefix=/usr
_make
_make install
_exec '
mv -v /usr/bin/fuser   /bin &&
mv -v /usr/bin/killall /bin
'
