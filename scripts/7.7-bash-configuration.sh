#!/bin/bash

# 7.7. The Bash Shell Startup Files  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter07/profile.html

cat > /etc/profile << "EOF"
# Begin /etc/profile

export LANG=en_US.UTF-8

# End /etc/profile
EOF
