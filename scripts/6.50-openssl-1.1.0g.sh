#!/bin/bash

# 6.50. OpenSSL-1.1.0g  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/openssl.html
_exec '
./config --prefix=/usr         \
        --openssldir=/etc/ssl \
        --libdir=lib          \
        shared                \
        zlib-dynamic
'
_make
#  One subtest in the test 40-test_rehash.t fails in the lfs chroot environment, but passes when run as a regular user. 
_make test

_exec "
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
"
_make DESTDIR=/tmp/openssl MANSUFFIX=ssl install

_exec '
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.0g &&
cp -vfr doc/* /usr/share/doc/openssl-1.1.0g
'
