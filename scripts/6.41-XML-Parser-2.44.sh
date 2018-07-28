#!/bin/bash

# 6.41. XML::Parser-2.44 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/xml-parser.html

_exec perl Makefile.PL
_make
_make test
_make install
