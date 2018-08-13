#!/bin/bash

# 6.73. Util-linux-2.31.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/util-linux.html

_exec 'mkdir -pv /var/lib/hwclock'
_configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
            --docdir=/usr/share/doc/util-linux-2.31.1 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            --without-systemd    \
            --without-systemdsystemunitdir
_make

# Fix one test which fails to get pty
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=841935
_exec '
export OLD_PERM=$(find /dev/pts/ptmx -printf %m) &&
chmod -v 0666 /dev/pts/ptmx &&
chown -Rv nobody . &&
su nobody -s /bin/bash -c "PATH=$PATH make -k check" &&
chmod -v 0${OLD_PERM} /dev/pts/ptmx'

_make install
