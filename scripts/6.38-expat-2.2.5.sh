#!/bin/bash

#  
#
_exec "sed -i 's|usr/bin/env |bin/|' run.sh.in"
_configure --prefix=/usr --disable-static

_make
_make_check
_make install

_exec '
install -v -dm755 /usr/share/doc/expat-2.2.5 &&
install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.5
'
