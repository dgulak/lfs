#!/bin/bash

# 6.53. Meson-0.44.0 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/meson.html

_exec '
python3 setup.py build &&
python3 setup.py install
'
