#!/bin/bash

cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF

ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6
ln -sfv libncurses.so.6 /usr/lib/libncurses.so

sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure

_configure --prefix=/usr           \
            --with-readline         \
            --mandir=/usr/share/man \
            --infodir=/usr/share/info

_make

# this is test check
echo "quit" | ./bc/bc -l Test/checklib.b > tests.log
FAILED_TEST_NUM=`grep -c Failed tests.log`
if [ $FAILED_TEST_NUM -gt 10 ]; then 
    _echo_err "$0 Failed test check: expected number of failed tests should be less than 10, but actual number is $FAILED_TEST_NUM"
    exit
fi

_make install
