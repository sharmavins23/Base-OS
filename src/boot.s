#include "mm.h"

.section    ".text.boot"

.globl      _start
_start:
            mrs         x0, mpidr_el1       ; Pull CPUID out
            and         x0, x0, #0xFF       ; Verify it is 0xFF
            cbz         x0, master          ; If it is, branch to master
            b           proc_hang           ; Otherwise, hang the processor

master:
            adr         x0, bss_begin
            adr         x1, bss_end         ; Get the stack space sizing
            sub         x1, x1, x0
            bl          memzero             ; Zero the entire memory block

            mov         sp, #LOW_MEMORY     ; Set the stack pointer
            bl          kernel_main         ; Call kernel.c code

            b           proc_hang           ; Hang the processor
                                            ; Since kernel.c loops infinitely,
                                            ;  this will never happen

proc_hang:
            wfe                             ; Wait for an instruction
            b           proc_hang