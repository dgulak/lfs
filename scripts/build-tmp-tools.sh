#!/bin/bash

LFS=/mnt/lfs

./build-pkg.sh

#####---------------------------------------------######
#              Strip unneeded symbols
strip --strip-debug /tools/lib/*
/usr/bin/strip --strip-unneeded /tools/{,s}bin/*
# Strip documentation
rm -rf /tools/{,share}/{info,man,doc}
# Strip other stuff
find /tools/{lib,libexec} -name \*.la -delete


####----------------------------------------------#####
#            Change the tools owner to root
chown -R root:root $LFS/tools

