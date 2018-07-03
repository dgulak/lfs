#!/bin/bash

declare -a packages=(
coreutils-8.29 
diffutils-3.6
)

export function _make (){
    make ${MAKE_THREAD_NUM} $@
}


for p in ${packages[@]} ; do
    echo "Building $p"
    pushd .
    tar -xf $p.tar.xz
    cd $p
    ./$p.sh
    popd 
done
