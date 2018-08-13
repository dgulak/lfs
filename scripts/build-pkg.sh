#!/bin/bash

if [ ! $1 ] ; then
    echo <<EOF 
Usage: $ $0 (5|6|7) [pkg] [k]
    5 or 6 or 7         - an LFS chapter; package(s) will be built with regards to the according chapter.
    pkg                 - [optional]. Means build only one package.
    k                   - keep packages, do not remove after build.
EOF
fi

LFS_CHAPTER=$1
PACK_TO_BUILD=$2
KEEP_PKG=$3
SRC_DIR=/lfs/sources
SCRIPT_DIR=$PWD
CUR_PACK=
MAKE_JOBS_NUM=3

export  CUR_PACK \
	SCRIPT_DIR \
	MAKE_JOBS_NUM


source common
source pkg-list-${LFS_CHAPTER} || { _echo_err "Chapter number is not valid" echo ; exit ; }

#####----------------------------------------------#####
# Check if one pkg is selected

if [ $PACK_TO_BUILD ] ; then 
   _OLD_PACK=$PACK_TO_BUILD
   PACK_TO_BUILD=`printf -- '%s\n' "${PACKAGES[@]}" | awk '{print $1}' | grep "^${PACK_TO_BUILD}-"`
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
    ARCH_FILE=${PACKAGES[$p]/ /.}

    test ${PACK_TO_BUILD} && { [ $CUR_PACK != $PACK_TO_BUILD ] && continue ; }

    SCRIPT_FILE=(/${SCRIPT_DIR}/${LFS_CHAPTER}*-${CUR_PACK}.sh)
    CHAPTER=${SCRIPT_FILE##/*/}
    CHAPTER=${CHAPTER%%-*sh}
    _echo_info "Building LFS ${CHAPTER} ${CUR_PACK}"

    pushd . > /dev/null
    
    tar -xf ${ARCH_FILE}
    cd  ${CUR_PACK}  || cd $(find . -name "${CUR_PACK%%-*}*" -type d) || { _echo_err 'Cannot "cd" to package dir' ; exit 1 ; }
    
    _echo_info "In $PWD"
    bash -c ${SCRIPT_FILE} 
    
    popd > /dev/null
    test $KEEP_PKG || { _echo_info "Removing build dir" ; rm -rf ${CUR_PACK} ; }

done

popd > /dev/null

