#!/usr/bin/env bash

# Based on https://blog.mozilla.org/data/2022/01/31/this-week-in-glean-building-and-deploying-a-rust-library-on-ios/

if [ "$#" -ne 2 ]
then
    echo "Usage (note: only call inside xcode!):"
    echo "compile-library.sh <FFI_TARGET> <buildvariant>"
    exit 1
fi

# what to pass to cargo build -p, e.g. your_lib_ffi
FFI_TARGET=$1
# buildvariant from our xcconfigs
BUILDVARIANT=$2

RELFLAG=
if [[ "$BUILDVARIANT" != "debug" ]]; then
  RELFLAG=--release
fi

set -euvx

if [[ -n "${DEVELOPER_SDK_DIR:-}" ]]; then
  # Assume we're in Xcode, which means we're probably cross-compiling.
  export LIBRARY_PATH="${DEVELOPER_SDK_DIR}/MacOSX.sdk/usr/lib:${LIBRARY_PATH:-}"
fi

IS_SIMULATOR=0
if [ "${LLVM_TARGET_TRIPLE_SUFFIX-}" = "-simulator" ]; then
  IS_SIMULATOR=1
fi

cd ../rustpart

if [ $IS_SIMULATOR -eq 0 ]; then
 # Hardware iOS targets
 $HOME/.cargo/bin/cargo build -p $FFI_TARGET --lib $RELFLAG --target aarch64-apple-ios
else
 $HOME/.cargo/bin/cargo build -p $FFI_TARGET --lib $RELFLAG --target aarch64-apple-ios-sim
fi
