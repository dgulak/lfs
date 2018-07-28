#!/bin/bash

# 6.28. Shadow-4.5 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/shadow.html

_exec "
sed -i 's/groups\$(EXEEXT) //' src/Makefile.in &&
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \; &&
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; &&
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \; &&
sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
       -e 's@/var/spool/mail@/var/mail@' etc/login.defs &&
sed -i 's/1000/999/' etc/useradd
"

_configure --sysconfdir=/etc \
           --with-group-name-max-length=32

_make
_make install

_exec '
mv -v /usr/bin/passwd /bin &&
pwconv && 
grpconv 
'
_echo_info "Install password for the root!"
passwd root

