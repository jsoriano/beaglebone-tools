#!/bin/bash

UBOOT_SOURCE=src/u-boot

BUILD_OPTIONS="CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm"

for patch in patches/u-boot/*; do
patch -N -d $UBOOT_SOURCE -p1 < $patch
done

make -C $UBOOT_SOURCE $BUILD_OPTIONS am335x_evm_config
make -C $UBOOT_SOURCE $BUILD_OPTIONS
