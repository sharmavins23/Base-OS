// Contains the kernel's main C code.

#include "common.h"
#include "mini_uart.h"

// Called from boot ASM file; initializes kernel structure
void kernel_main() {
    // Initialize UART functionality
    uart_init();

    // Send a message on boot to serial
    uart_send_string("Raspberry Pi Bare Metal OS initializing...\n");

// Serial log board name
#if RPI_VERSION == 3
    uart_send_string("\tBoard: Raspberry Pi 3\n");
#endif

#if RPI_VERSION == 4
    uart_send_string("\tBoard: Raspberry Pi 4\n");
#endif

    uart_send_string("\n\nInitialization complete.\n");

    // // For now, loop forever and repeat character from UART input
    // while (1) {
    //     uart_send(uart_recv());
    // }

    return;
}
