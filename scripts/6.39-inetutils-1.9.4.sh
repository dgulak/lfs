#!/bin/bash

# 6.39. Inetutils-1.9.4  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/inetutils.html

_configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers
_make
_make_check
_make install
_exec '
mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin &&
mv -v /usr/bin/ifconfig /sbin
'
