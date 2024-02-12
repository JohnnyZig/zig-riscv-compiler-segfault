# Reproducer for zig compiler segfault

This is minimal reproducer for zig compiler segfault which I stumbled upon while developing firmware for RISC-V MCU.  
Running example in this code will result in segfault.  
```
zig build-exe esp32.elf Debug riscv32-freestanding-eabi: error: the following command terminated unexpectedly:
/usr/local/bin/zig build-exe /usr/home/johnny/esp32/zig-compiler-segfault/src/main.zig --cache-dir /usr/home/johnny/esp32/zig-compiler-segfault/zig-cache --global-cache-dir /home/johnny/.cache/zig --name esp32.elf -target riscv32-freestanding-eabi -mcpu generic_rv32+c+m --listen=-
Build Summary: 0/3 steps succeeded; 1 failed (disable with --summary none)
install transitive failure
└─ install esp32.elf transitive failure
   └─ zig build-exe esp32.elf Debug riscv32-freestanding-eabi failure
error: the following build command failed with exit code 1:
/usr/home/johnny/esp32/zig-compiler-segfault/zig-cache/o/d38675a4df95c6c71ea70b9bbcd68b1d/build /usr/local/bin/zig /usr/home/johnny/esp32/zig-compiler-segfault /usr/home/johnny/esp32/zig-compiler-segfault/zig-cache /home/johnny/.cache/zig
```

Fix:  
```
- REG: Register([2]Bits),
+ REG: [2]Register(Bits),
```
