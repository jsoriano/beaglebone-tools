#!/bin/bash

. ./config.sh

LINUX=$KERNEL_SOURCE/arch/arm/boot/zImage
ROOTFS=$BUSYBOX_SOURCE/rootfs.img.gz
UBOOT=$UBOOT_SOURCE/u-boot.bin

MKIMAGE="mkimage -A arm -C none -O linux"

$MKIMAGE -T kernel -d $LINUX -a 0x00010000 -e 0x00010000 zImage.uimg
$MKIMAGE -T ramdisk -d $ROOTFS -a 0x00800000 -e 0x00800000 rootfs.uimg

dd if=/dev/zero of=flash.bin bs=1 count=6M
dd if=$UBOOT of=flash.bin conv=notrunc bs=1
dd if=zImage.uimg of=flash.bin conv=notrunc bs=1 seek=2M
dd if=rootfs.uimg of=flash.bin conv=notrunc bs=1 seek=4M

