use std::os::raw::c_int;

#[no_mangle]
pub extern "C" fn shipping_rust_add(a: c_int, b: c_int) -> c_int {
    a + b
}

