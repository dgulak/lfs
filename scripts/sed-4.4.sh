#!/bin/bash

# 5.30. Sed-4.4 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/sed.html
./configure --prefix=/tools
_make
_make check
_make install
