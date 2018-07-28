#!/bin/bash

# 6.32. Flex-2.6.4 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/flex.html 

_exec 'sed -i "/math.h/a #include <malloc.h>" src/flexdef.h' 

_HELP2MAN=/tools/bin/true \
_configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

_make
_make_check
_make install

_exec ln -sv flex /usr/bin/lex
