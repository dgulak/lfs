#!/bin/bash

if [ ! $1 ] ; then
    echo <<EOF 
Usage: $ $0 (5|6) [pkg]   
    5|6 - is an LFS chapter; package(s) will be built with regards to the according chapter.
    pkg - [optional]. Means build only one package.
EOF
fi

source pkg-list-${LFS_CHAPTER}
source common

LFS_CHAPTER=$1
PACK_TO_BUILD=$2
SRC_DIR=/lfs/sources
SCRIPT_DIR=$PWD
CUR_PACK=
MAKE_JOBS_NUM=4

export  CUR_PACK \
	SCRIPT_DIR \
	MAKE_JOBS_NUM


#####----------------------------------------------#####
# Check if one pkg is selected

if [ $PACK_TO_BUILD ] ; then 
   _OLD_PACK=$PACK_TO_BUILD
   PACK_TO_BUILD=`printf -- '%s\n' "${PACKAGES[@]}" | awk '{print $1}' | grep "${PACK_TO_BUILD}-"`
   echo "Asked to build only ${PACK_TO_BUILD}"
   test ${PACK_TO_BUILD} || { _echo_err "No package ${_OLD_PACK}" && exit 1;}
fi

rm -rf logs
mkdir -p logs

pushd . > /dev/null
cd $SRC_DIR 


#####----------------------------------------------#####
# Install packages

for p in ${!PACKAGES[*]} ; do
    CUR_PACK=`echo ${PACKAGES[$p]} | awk '{print $1}'`
    TAR=${PACKAGES[$p]/ /.}

    test ${PACK_TO_BUILD} && { [ $CUR_PACK != $PACK_TO_BUILD ] && continue ; }

    _echo_info "Building ${CUR_PACK}"

    pushd . > /dev/null
    
    tar -xf ${TAR}
    cd ${CUR_PACK}
    
    ${SCRIPT_DIR}/${CUR_PACK}.sh
    
    popd > /dev/null
    rm -rf ${CUR_PACK}

done

popd > /dev/null

