@ Delays the processor for a certain amount of time
@ x0 (u64)  ticks       Tick count of time
.globl      delay
delay:      subs        x0, x0, #1          @ Subtract one tick from x0 count
            bne         delay               @ If not zero, repeat
            ret

@ Places 32'b of data in the specified address
@ x0 (u64)  address     Address to place data in
@ w1 (u32)  value       Value to place
.globl      put32
put32:      str         w1, [x0]            @ Store value w1 in address x0
            ret

@ Gets 32'b of data from the specified address
@ x0 (u64)  address     Address to receive data from
@ w0 (u32)  value       Value return
.globl      get32
get32:      ldr         w0, [x0]            @ Load value w0 from address x0
            ret