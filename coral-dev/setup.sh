#!/bin/bash



if [ "$1" != "" ]; then
    echo "coral-dev yocto root directory is $1"
    cp conf/*.conf $1/build/conf
    cp *.gir $1/build/tmp/work/aarch64-fslc-linux/clutter-gst-3.0/3.0.27-r0/recipe-sysroot/usr/share/gir-1.0
    echo 'CONFIG_LOCALVERSION="-coral"' >> $1/sources/meta-coral/meta-coral-bsp/recipes-kernel/linux/linux-imx/coral-dev/defconfig
    echo 'CONFIG_EXTRA_FIRMWARE_DIR="firmware"' >> $1/sources/meta-coral/meta-coral-bsp/recipes-kernel/linux/linux-imx/coral-dev/defconfig
    echo 'CONFIG_EXTRA_FIRMWARE="sdma-imx7d.bin"' >> $1/sources/meta-coral/meta-coral-bsp/recipes-kernel/linux/linux-imx/coral-dev/defconfig
    cp *.bin $1/build/tmp/work-shared/coral-dev/kernel-source/firmware
    cp fsl-image-multimedia.bb $1/sources/meta-freescale-distro/recipes-fsl/images


else
    echo "root directory of coral-dev yocto is required"
fi