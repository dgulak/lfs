#!/bin/bash

# 5.24. Gettext-0.19.8.1 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/gettext.html

# For our temporary set of tools, we only need to build and install three programs from Gettext. 
cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

# Compile the package:
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

# Install the msgfmt, msgmerge and xgettext programs: 
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
