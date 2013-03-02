#!/bin/bash

export LANG=C

BUILD_OPTIONS="CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm"

BUSYBOX_SOURCE=src/busybox
KERNEL_SOURCE=src/linux
UBOOT_SOURCE=src/u-boot
