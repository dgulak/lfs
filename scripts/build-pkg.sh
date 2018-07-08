#!/bin/bash
# You can give it a package name without version and it will build only that package
# e.g. : $ ./prepare.sh tar


PACK_TO_BUILD=$1
SRC_DIR=/work/sources
SCRIPT_DIR=$PWD
declare -a PACKAGES=(
'coreutils-8.29 tar.xz'
'diffutils-3.6 tar.xz'
'file-5.32 tar.gz'
'findutils-4.6.0 tar.gz'
'gawk-4.2.0 tar.xz'
'gettext-0.19.8.1 tar.xz'
'grep-3.1 tar.xz'
'gzip-1.9 tar.xz'
'make-4.2.1 tar.bz2'
'patch-2.7.6 tar.xz'
'perl-5.26.1 tar.xz'
'sed-4.4 tar.xz'
'tar-1.30 tar.xz'
'texinfo-6.5.tar.xz'
'util-linux-2.31.1.tar.xz'
'xz-5.2.3.tar.xz'
)
CUR_PACK=
MAKE_JOBS_NUM=4


export  CUR_PACK \
	SCRIPT_DIR \
	MAKE_JOBS_NUM
#####

function _echo_info() {
   echo -e "\e[32m ${@} \e[0m"
}

function _echo_err() {
   echo -e "\e[31m ${@} \e[0m"
}

function _exec() {
    CMD=${@}
        LOG=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.log 
    LOG_ERR=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.err

    echo ${CMD}
    ${CMD} >>${LOG} 2>>${LOG_ERR} || _echo_err "Failed"
    
}

function _configure() {
    CMD="./configure ${@}"
        LOG=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.log 
    LOG_ERR=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.err
    
    echo ${CMD}
    ${CMD} >>${LOG} 2>>${LOG_ERR} || _echo_err "Failed"
}

function _make () {
    CMD="make -j${MAKE_JOBS_NUM} ${@}"
        LOG=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.log 
    LOG_ERR=${SCRIPT_DIR}/logs/${CUR_PACK}.tmp.err
 
    echo ${CMD}
    ${CMD} >>${LOG} 2>>${LOG_ERR} || _echo_err "Failed"
}

export -f _echo_err \
	_echo_info \
	_exec \
	_configure \
	_make 


#####----------------------------------------------#####
#                 Install packages

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

