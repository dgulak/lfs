#!/bin/bash

declare -A packages=(
[coreutils-8.29]=tar.xz 
[diffutils-3.6]=tar.xz
[file-5.32]=tar.gz
[findutils-4.6.0]=tar.gz
[gawk-4.2.0]=tar.xz
[gettext-0.19.8.1.]=tar.xz
[grep-3.1]=tar.xz
[gzip-1.9]=tar.xz
[make-4.2.1]=tar.bz2
[patch-2.7.6]=tar.xz
[perl-5.26.1]=tar.xz
[sed-4.4]=tar.xz
[tar-1.30=]=tar.xz
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
