#!/bin/bash

# 6.37. Gperf-3.1
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/gperf.html

_configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1
_make
_make_check -j1
_make install
