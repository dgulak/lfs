#!/bin/bash

# 6.56. Coreutils-8.29 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/coreutils.html

_exec '
patch -Np1 -i ../coreutils-8.29-i18n-1.patch &&
sed -i '"'"'/test.lock/s/^/#/'"'"' gnulib-tests/gnulib.mk
'
FORCE_UNSAFE_CONFIGURE=1  \
_configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime

FORCE_UNSAFE_CONFIGURE=1 \
_make


NON_ROOT_USERNAME=nobody \
_make check-root

_exec '
echo "dummy:x:1000:nobody" >> /etc/group &&
chown -Rv nobody . &&
su nobody -s /bin/bash \
          -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check" &&
sed -i '"'"'/dummy/d'"'"' /etc/group
'

_make install

_exec '
mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin &&
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin &&
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin &&
mv -v /usr/bin/chroot /usr/sbin &&
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8 &&
sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8 &&
mv -v /usr/bin/{head,sleep,nice} /bin
'