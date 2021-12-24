#pragma once
// Simple utilty functions.

#include "common.h"

// Delays the processor for a certain amount of time
void delay(u64 ticks);

// Places 32'b of data in the specified address
void put32(u64 address, u32 value);

// Gets 32'b of data from the specified address
u32 get32(u64 address);