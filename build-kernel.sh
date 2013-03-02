#!/bin/bash

. ./config.sh

META_TI_SOURCE=src/angstrom-meta-ti
DEFAULT_CONFIG=$META_TI_SOURCE/recipes-kernel/linux/linux-mainline-3.2/beagleboard/defconfig
CPUS=`grep "^processor" /proc/cpuinfo | wc -l`

cp $DEFAULT_CONFIG $KERNEL_SOURCE/.config
make -C $KERNEL_SOURCE olddefconfig $BUILD_OPTIONS
make -C $KERNEL_SOURCE -j$CPUS bzImage $BUILD_OPTIONS
