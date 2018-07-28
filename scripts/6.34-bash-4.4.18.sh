#!/bin/bash

# 6.34. Bash-4.4.18 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/bash.html

_configure --prefix=/usr                       \
            --docdir=/usr/share/doc/bash-4.4.18 \
            --without-bash-malloc               \
            --with-installed-readline

_make

# Tests
 _exec '
chown -Rv nobody . &&
su nobody -s /bin/bash -c "PATH=$PATH make tests"
'

_make install 
_exec mv -vf /usr/bin/bash /bin


