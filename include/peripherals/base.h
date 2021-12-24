#pragma once
// Contains peripheral base addresses for various RPI versions.

// https://github.com/raspberrypi/linux/tree/rpi-5.4.y/arch/arm/boot/dts/bcm2837.dtsi
#if RPI_VERSION == 3
#define PBASE 0x3F000000

// https://github.com/raspberrypi/linux/tree/rpi-5.4.y/arch/arm/boot/dts/bcm2711.dtsi
#elif RPI_VERSION == 4
#define PBASE 0xFE000000

#else
#define PBASE 0
#error RPI_VERSION NOT DEFINED

#endif