# Base OS

A basic operating system that runs Assembly code, simplifies pin configurations
via Assembly callables, and allows for basic UART operation on the Raspberry Pi
3 and 4.

## Definition Order

The following is the (rough) order this project was created in:

1. `Makefile`
2. `boot/config.txt`
3. `include/peripherals/base.h`
4. `include/common.h`
5. `include/utils.h` and `src/utils.s`
6. `include/mm.h` and `src/mm.s`
7. `src/kernel.c` and `src/boot.s`
8. `include/mini_uart.h` and `include/peripherals/auxi.h`
9. `include/peripherals/gpio.h` and `src/gpio.c`

# License TL;DR

This project is distributed under the MIT license. This is a paraphrasing of a
[short summary](https://tldrlegal.com/license/mit-license).

This license is a short, permissive software license. Basically, you can do
whatever you want with this software, as long as you include the original
copyright and license notice in any copy of this software/source.

## What you CAN do:

- You may commercially use this project in any way, and profit off it or the
  code included in any way;
- You may modify or make changes to this project in any way;
- You may distribute this project, the compiled code, or its source in any way;
- You may incorporate this work into something that has a more restrictive
  license in any way;
- And you may use the work for private use.

## What you CANNOT do:

- You may not hold me (the author) liable for anything that happens to this code
  as well as anything that this code accomplishes. The work is provided as-is.

## What you MUST do:

- You must include the copyright notice in all copies or substantial uses of the
  work;
- You must include the license notice in all copies or substantial uses of the
  work.

If you're feeling generous, give credit to me somewhere in your projects.
