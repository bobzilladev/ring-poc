#!/bin/bash

curl --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
export PATH="$HOME/.cargo/bin:$PATH"
if [[ "$1" == "true" ]]; then
  echo "*** Setting __ARM_ARCH ***"
  # ring 0.17 assembly build needs __ARM_ARCH set
  export CFLAGS_aarch64_unknown_linux_gnu="-D__ARM_ARCH=8"
else
  echo "*** Not setting __ARM_ARCH ***"
fi
rustup component add llvm-tools-preview || true
rustup target add aarch64-unknown-linux-gnu
cargo build --target=aarch64-unknown-linux-gnu
