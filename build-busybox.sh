#!/bin/bash

BUSYBOX_SOURCE=src/busybox

BUILD_OPTIONS="CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm"

make -C $BUSYBOX_SOURCE $BUILD_OPTIONS defconfig

sed -i "s/CONFIG_STATIC=n/CONFIG_STATIC=y/" $BUSYBOX_SOURCE/.config

make -C $BUSYBOX_SOURCE $BUILD_OPTIONS install
