#!/bin/bash

# 5.30. Sed-4.4 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/sed.html
_configure --prefix=/tools
_make
_make_check
_make install
