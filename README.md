# ring-poc
Proof of concept for ring 0.17 compilation issue cross-compiling to aarch64 via `manylinux2014-cross:aarch64`.

## Demo
Tested on an Ubuntu `22.04.2` x86\_64 machine.

`Linux ip-10-0-0-245 5.19.0-1027-aws #28~22.04.1-Ubuntu SMP Wed May 31 18:30:36 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux`

Guessing the included GCC does not have ARM\_ARCH fined in docker image: `ghcr.io/rust-cross/manylinux2014-cross:aarch64`.

A GCC thread about ARM_ARCH: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99312

### Execute `run-error.sh` to show the error:

```
warning: In file included from /root/.cargo/registry/src/index.crates.io-6f17d22bba15001f/ring-0.17.3/pregenerated/aesv8-armx-linux64.S:4:0:
warning: include/ring-core/asm_base.h:73:2: error: #error "ARM assembler must define __ARM_ARCH"
warning:  #error "ARM assembler must define __ARM_ARCH"
warning:   ^
warning: In file included from /root/.cargo/registry/src/index.crates.io-6f17d22bba15001f/ring-0.17.3/pregenerated/aesv8-armx-linux64.S:7:0:
warning: include/ring-core/arm_arch.h:82:2: error: #error "ARM assembler must define __ARM_ARCH"
warning:  #error "ARM assembler must define __ARM_ARCH"
```

### Execute `run-ok.sh` to show the workaround happening:

This includes `export CFLAGS_aarch64_unknown_linux_gnu="-D__ARM_ARCH=8"`

```
Compiling ring v0.17.3
Compiling ring-poc v0.1.0 (/build)
Finished dev [unoptimized + debuginfo] target(s) in 8.69s
```
