// Stores N null bits(?) starting in a specified address
// x0 (u64)  src         Source address
// x1 (u32)  n           Number of bytes to zero
.globl      memzero
memzero:    str         xzr, [x0], #8       // Store 8 bytes in this position
            subs        x1, x1, #8
            b.gt        memzero             // If we have more positions, repeat
            ret