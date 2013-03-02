#!/bin/bash

. ./config.sh

for patch in patches/u-boot/*; do
patch -N -d $UBOOT_SOURCE -p1 < $patch
done

make -C $UBOOT_SOURCE $BUILD_OPTIONS am335x_evm_config
make -C $UBOOT_SOURCE $BUILD_OPTIONS
