#!/bin/bash

# 6.52. Ninja-1.8.2 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/ninja.html

_exec '
python3 configure.py --bootstrap &&
python3 configure.py &&
./ninja ninja_test &&
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots &&
install -vm755 ninja /usr/bin/ &&
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja &&
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja
'

