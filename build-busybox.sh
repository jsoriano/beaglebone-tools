#!/bin/bash

. ./config.sh

make -C $BUSYBOX_SOURCE $BUILD_OPTIONS defconfig

sed -i "s/CONFIG_STATIC=n/CONFIG_STATIC=y/" $BUSYBOX_SOURCE/.config

make -C $BUSYBOX_SOURCE $BUILD_OPTIONS install

cd $BUSYBOX_SOURCE/_install
find . | cpio -o --format=newc | gzip -c > ../rootfs.img.gz
cd -
