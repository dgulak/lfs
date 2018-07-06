#!/bin/bash

# 5.29. Perl-5.26.1 
# http://www.linuxfromscratch.org/lfs/view/8.2/chapter05/perl.html
_exec sh Configure -des -Dprefix=/tools -Dlibs=-lm
_make
    
# install
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.26.1
cp -Rv lib/* /tools/lib/perl5/5.26.1
