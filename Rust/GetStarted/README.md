## Somme concept
  - `rustup` : install Rust toolchain same as `nvm` for Node.js
  - `cargo` : Rust package manager and build system, same as `npm` for Node.js
  - `crates.io` : Rust package registry, same as `npmjs.com`
  - `rustc` : Rust compiler
  - `rustdoc` : Rust documentation generator


## Hello word 

`main.rs` file:

```rust
fn main() {
    println!("Hello, world!");
}
```

To compile and run the program:

```bash
rustc main.rs
./main
```
This will output:

```
Hello, world!
```
 - `!` is a macro in Rust, used for call like functions that can take a variable number of arguments.