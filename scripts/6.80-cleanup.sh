#!/bin/bash

rm -rf /tmp/*

# There were several static libraries that were not suppressed earlier in the chapter in 
# order to satisfy the regression tests in several packages. These libraries are from 
# binutils, bzip2, e2fsprogs, flex, libtool, and zlib. If desired, remove them now: 
rm -f /usr/lib/lib{bfd,opcodes}.a
rm -f /usr/lib/libbz2.a
rm -f /usr/lib/lib{com_err,e2p,ext2fs,ss}.a
rm -f /usr/lib/libltdl.a
rm -f /usr/lib/libfl.a
rm -f /usr/lib/libfl_pic.a
rm -f /usr/lib/libz.a

# "libtool archive" files and generally unneeded on a linux system
find /usr/lib -name \*.la -delete
