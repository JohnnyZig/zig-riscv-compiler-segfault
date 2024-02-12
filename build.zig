const std = @import("std");

pub fn build(b: *std.Build) void
{
	const target = .{
		.cpu_arch = .riscv32,
		.cpu_model = .{ .explicit = &std.Target.riscv.cpu.generic_rv32 },
		.os_tag = .freestanding,
		.abi = .eabi,
	};

	const optimize = b.standardOptimizeOption(.{});

	const exe = b.addExecutable(.{
		.name = "esp32.elf",
		.root_source_file = .{ .path = "src/main.zig" },
		.target = target,
		.optimize = optimize,
	});

	b.installArtifact(exe);
}
