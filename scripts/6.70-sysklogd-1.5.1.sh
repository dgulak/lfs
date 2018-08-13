#!/bin/bash

# 6.70. Sysklogd-1.5.1 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/sysklogd.html

_exec "
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c &&
sed -i 's/union wait/int/' syslogd.c
"
_make
_make BINDIR=/sbin install

_exec '
cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF
'

