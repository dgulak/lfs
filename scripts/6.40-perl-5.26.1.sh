#!/bin/bash

# 6.40. Perl-5.26.1  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/perl.html

_exec "
echo \"127.0.0.1 localhost \$(hostname)\" > /etc/hosts &&
export BUILD_ZLIB=False &&
export BUILD_BZIP2=0 &&
sh Configure -des \
    -Dprefix=/usr                 \
    -Dvendorprefix=/usr           \
    -Dman1dir=/usr/share/man/man1 \
    -Dman3dir=/usr/share/man/man3 \
    -Dpager=\"/usr/bin/less -isR\"  \
    -Duseshrplib                  \
    -Dusethreads
"
_make
_make -k test
_make install
_exec unset BUILD_ZLIB BUILD_BZIP2



