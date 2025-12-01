## Stack

In Rust, the stack is a region of memory that stores data in a last-in, first-out (LIFO) manner. It is used for storing variables with a known, fixed size at compile time. When a function is called, its local variables are pushed onto the stack, and when the function returns, those variables are popped off the stack.

```rust
fn main() {
    let x = 5; // x is stored on the stack
    let y = 10; // y is also stored on the stack
    let z = add(x, y); // calling a function
    println!("The sum is: {}", z);
}
fn add(a: i32, b: i32) -> i32 {
    a + b // a and b are also stored on the stack
}
```

Output:

```
The sum is: 15
```

-   Variables like `x`, `y`, `a`, and `b` are stored on the stack because they have a known size at compile time (i32).

## Heap

The heap is a region of memory used for dynamic memory allocation. When you need to store data that can grow or shrink in size at runtime, you allocate it on the heap. In Rust, this is often done using smart pointers like `Box`, `Vec`, and `String`.

```rust
fn main() {
    let s = String::from("Hello, world!"); // s is stored on the heap
    let len = calculate_length(&s); // passing a reference to s
    println!("The length of '{}' is {}.", s, len);
}
fn calculate_length(s: &String) -> usize {
    s.len()
}
```

Output:

```
The length of 'Hello, world!' is 13.
```

-   The `String` type allocates memory on the heap to store its contents, allowing it to grow as needed.
-   The reference `&s` allows the function to borrow the string without taking ownership.

## Ownership

### Rule

1. Each value in Rust has a variable that’s called its owner.
2. There can only be one owner at a time.
3. When the owner goes out of scope, the value will be dropped.


### Memory and Allocating 

```rust
fn main() {
    let s1 = String::from("hello"); // s1 is the owner of the string
    let s2 = s1; // ownership of the string is moved to s2
    // println!("{}", s1); // this line would cause a compile-time error because s1 is no longer valid
    println!("{}", s2); // this works because s2 is the current owner
}
```

Output:
```
hello
```

 - Rust has two types of memory management: Stack and Heap. In this example memory Stack has value `ptr` to point to Heap memory where the actual string data is stored. `len` is the length of the string, and `capacity` is the total amount of memory allocated for the string.

=> 3 case s of ownership transfer:
1. Deep Copy 
 - Copy memory Stack and Heap into new variable.

3. Shadow copy
 - Only copy memory Stack into new variable, old variable become invalid. This cause double free error if both variable try to free same memory Heap.
  
4. Move
 - Only copy memory Stack into new variable, old variable become invalid. Rust automatically free memory Heap when owner variable go out of scope.

### References and Borrowing

```rust
fn main() {
    let s1 = String::from("hello");
    let len = calculate_length(&s1); // passing a reference to s1
    println!("The length of '{}' is {}.", s1, len); // s1 is still valid here
}
fn calculate_length(s: &String) -> usize {
    s.len()
}
```
Output:

```
The length of 'hello' is 5.
```

-   The `&s1` syntax creates a reference to `s1`, allowing the function to borrow the string without taking ownership.
-   References are immutable by default, meaning you cannot modify the data they point to. If you need to modify the data, you can use mutable references.

```rust
fn main() {
    let mut s = String::from("hello");
    change(&mut s); // passing a mutable reference to s
    println!("{}", s); // s is modified
}
fn change(some_string: &mut String) {
    some_string.push_str(", world"); // modifying the string through the mutable reference
}
```

Output:

```
hello, world
```

-   The `&mut s` syntax creates a mutable reference to `s`, allowing the function to modify the string.
-   Rust enforces rules to ensure memory safety with references:
    1. You can have either one mutable reference or any number of immutable references to a particular piece of data at a time.
    2. References must always be valid.
---

### Slices
Slices are a kind of reference that allow you to view a contiguous sequence of elements in a collection without taking ownership of the collection itself. They are commonly used with strings and arrays.

```rust
fn main() {
    let s = String::from("hello world");
    let hello = &s[0..5]; // slice of the first 5 characters
    let world = &s[6..11]; // slice of the last 5 characters
    println!("{} {}", hello, world);
}
```
Output:

```
hello world
```
-   Best practices: type String same as &str ex:
  
```rust
fn first_word(s: &str) -> &str {
    let bytes = s.as_bytes();
    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }
    &s[..]
}
fn main() {
    let my_string = String::from("hello world");
    let word = first_word(&my_string[..]); // passing a slice of the String
    println!("First word: {}", word);

    let my_str = "hello world";
    let word = first_word(my_str); // passing a string slice
    println!("First word: {}", word);
}
```
Output:

```
First word: hello
First word: hello
```
### Problem

```rust
fn main() {
    let mut s = String::from("hello world");

    let word = first_word(&s); // word will get the value 5

    s.clear();
    println!("{}",word );
}


fn first_word(s: &String) -> usize {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return i;
        }
    }

    s.len()
}
```

- Above code will cause error because after `s.clear()` the string is empty but `word` still hold the index of the first word which is now invalid.
- To solve this problem we can use string slices instead of returning the index.

```rust
fn main() {
    let mut s = String::from("hello world");

    let word = first_word(&s); // word will be a slice of the first word

    s.clear();
    // println!("{}",word ); // this line would cause a compile-time error because word is no longer valid
}   
fn first_word(s: &String) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s[..]
} 
```

- In this updated code, `first_word` returns a string slice (`&str`) instead of an index. This way, if the original string is modified (like being cleared), any slices referencing it become invalid, and Rust will prevent you from using them, ensuring memory safety.

