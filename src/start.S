.section    .init

// Define GPIO pin 21
.equ        PIN,        0x15                // Pin 21 = 0x15 HEX
.equ        SLEEP,      0x99                // Delay for 153 clocks

.globl      main
main:       ldr         x0, =PIN            // Enable output for pin 21
            bl          gpio_pin_enable_output

looop:      ldr         x0, =SLEEP
            bl          delay

            ldr         x0, =PIN            // Turn on pin 21
            bl          gpio_pin_set_high

            ldr         x0, =SLEEP
            bl          delay

            ldr         x0, =PIN            // Turn off pin 21
            bl          gpio_pin_set_low

            b           looop
