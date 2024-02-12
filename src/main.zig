const std = @import("std");

pub fn Register(comptime Reg: type) type
{
	return extern struct {
		raw_value: std.meta.Int(.unsigned, @bitSizeOf(Reg)),
	};
}

const MmioPeriph = extern struct {
	REG:	Register([2]Bits),	// segfaults, also with [1]
	// REG:	[2]Register(Bits),	// works
};

const Bits = packed struct (u32) {
	bit1:	u1,
	bit2:	u1,
	pad:	u30,
};

const PERIPH = @as(*volatile MmioPeriph, @ptrFromInt(0x6000_4000));

export fn _start() void
{
	const x = PERIPH.REG;
	_ = x;
}
