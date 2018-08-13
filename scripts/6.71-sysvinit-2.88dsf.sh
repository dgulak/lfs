#!/bin/bash

# 6.71. Sysvinit-2.88dsf  
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/sysvinit.html

_exec 'patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch'
_make -C src
_make -C src install
