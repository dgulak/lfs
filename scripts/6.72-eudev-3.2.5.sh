#!/bin/bash

# 6.72. Eudev-3.2.5  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/eudev.html

_exec '
sed -r -i '"'"'s|/usr(/bin/test)|\1|'"'"' test/udev-test.pl &&
cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF
'

_configure  --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-manpages       \
            --disable-static        \
            --config-cache

LIBRARY_PATH=/tools/lib _make

_exec '
mkdir -pv /lib/udev/rules.d &&
mkdir -pv /etc/udev/rules.d
'
# if check fails try fixing the test
# sed -r -i 's/\/bin\/test/\/usr\/bin\/test/' test/udev-test.pl
# LFS instruction doesn't fix it
LD_LIBRARY_PATH=/tools/lib _make_check
LD_LIBRARY_PATH=/tools/lib _make install

_exec '
tar -xvf ../udev-lfs-20171102.tar.bz2 &&
make -f udev-lfs-20171102/Makefile.lfs install &&
LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update
'
