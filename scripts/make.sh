#!/bin/bash

declare -A packages=(
[coreutils-8.29]=tar.xz 
[diffutils-3.6]=tar.xz
[file-5.32]=tar.gz
[findutils-4.6.0]=tar.gz
[gawk-4.2.0]=tar.xz
)

export function _make (){
    make ${MAKE_THREAD_NUM} $@
}

for p in ${!packages[@]} ; do
    echo "Building $p"
    pushd .
    tar -xf $p.${packages[$p]}
    cd $p
    ./$p.sh
    popd 
done
