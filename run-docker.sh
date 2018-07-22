#!/bin/bash

if [ ! ${LFS_DIR} ] ; then
    echo -e "\e[31m LFS_DIR is not set\e[0m"
    exit 1
fi

docker run -it --privileged \
--mount "type=bind,src=${LFS_DIR}/docker/lfs.mount,dst=/mnt/lfs" \
--mount "type=bind,src=${LFS_DIR}/scripts,dst=/lfs/scripts" \
--mount "type=volume,src=lfs-work-dir,dst=/lfs" \
dgulak/lfs:latest zsh

