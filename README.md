# rust-ios-xcconfig

A simplified version of https://blog.mozilla.org/data/2022/01/31/this-week-in-glean-building-and-deploying-a-rust-library-on-ios/

using Xcode xcconfig system for clarity.

Assumes Rust cross compilation is setup already, i.e.:
```
rustup target add aarch64-apple-ios
rustup target add aarch64-apple-ios-sim
```

The notes in the xcconfig explain how this was project setup: [xcodepart/Config.xcconfig](xcodepart/Config.xcconfig)

One directory has the Rust code, the other the Xcode+swift. 
Open the xcode project and build, and it will show a single view that calls the exported Rust function.

