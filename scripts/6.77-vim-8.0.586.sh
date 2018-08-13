#!/bin/bash

# 6.77. Vim-8.0.586 
# http://www.linuxfromscratch.org/lfs/view/stable/chapter06/vim.html

_exec '
echo '"'"'#define SYS_VIMRC_FILE "/etc/vimrc"'"'"' >> src/feature.h &&
sed -i '"'"'/call/{s/split/xsplit/;s/303/492/}'"'"' src/testdir/test_recover.vim
'

_configure --prefix=/usr
_make

# Run tests
_exec '
make -j1 test &> vim-test.log &&
if [ "$(grep -c '"'"'ALL DONE'"'"' vim-test.log)" == "0" ] ; then \
    _echo_err "Tests failed!" ; false ; \
else \
    _echo_info "Tests have passed successfully" ; \
fi
' 

# Install the package: 
_make install
_exec '
ln -sv vim /usr/bin/vi &&
for L in  /usr/share/man/{,*/}man1/vim.1; do \
    ln -sv vim.1 $(dirname $L)/vi.1 ;\
done &&
ln -sv ../vim/vim80/doc /usr/share/doc/vim-8.0.586
'

# 6.77.2. Configuring Vim 
_exec '
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set noautoindent
set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF
'
