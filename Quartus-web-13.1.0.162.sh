#!/bin/bash
# quartus13
export ALTERAPATH="/home/timmy/altera/13.1"
export ALTERAOCLSDKROOT="${ALTERAPATH}/hld"
export QUARTUS_ROOTDIR=${ALTERAPATH}/quartus
export QUARTUS_ROOTDIR_OVERRIDE="$QUARTUS_ROOTDIR"
export QSYS_ROOTDIR="${ALTERAPATH}/quartus/sopc_builder/bin"
export PATH=$PATH:${ALTERAPATH}/quartus/bin
export PATH=$PATH:${ALTERAPATH}/nios2eds/bin
quartus &
