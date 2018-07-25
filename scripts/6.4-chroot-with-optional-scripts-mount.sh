#!/bin/bash

# First load virtual FS and then mount scripts with sources
./6.2-kernel-fs.sh
mkdir -pv $LFS/lfs/
mount -v --bind /lfs $LFS/lfs


chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
