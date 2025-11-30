## Variables and Mutability

In Rust, variables are immutable by default, meaning once a value is assigned to a variable, it cannot be changed. However, you can make a variable mutable by using the `mut` keyword.
```rust
fn main() {
    let x = 5; // immutable variable
    println!("The value of x is: {}", x);
    
    let mut y = 10; // mutable variable
    println!("The value of y is: {}", y);
    
    y = 15; // changing the value of mutable variable
    println!("The new value of y is: {}", y);
}
```

Output:
```
The value of x is: 5
The value of y is: 10
The new value of y is: 15
```
- `let` is used to declare a variable.
- `mut` allows the variable to be mutable, enabling its value to be changed after initial assignment.
- `{}` is a placeholder in the `println!` macro for variable substitution.

## Constant 
Constants are always immutable and must have a type annotation. They are declared using the `const` keyword.
```rust
fn main() {
    const MAX_POINTS: u32 = 100_000; // constant declaration
    println!("The maximum points are: {}", MAX_POINTS);
}
```
Output:
```
The maximum points are: 100000
```
- `const` is used to declare a constant value that cannot be changed and must have a type specified.
- `u32` is an unsigned 32-bit integer type.

## Shadowing
Shadowing allows you to declare a new variable with the same name as a previous variable. The new variable shadows the previous one.
```rust
fn main() {
    let x = 5;
    let x = x + 1; // shadows the previous x
    {
        let x = x * 2; // shadows the previous x within this block
        println!("The value of x in the inner scope is: {}", x);
    }
    println!("The value of x in the outer scope is: {}", x);
}
```
Output:
```
The value of x in the inner scope is: 12
The value of x in the outer scope is: 6
```
- Shadowing allows you to reuse variable names while creating new bindings, which can be useful for transformations or calculations without needing to create new variable names.
- Block scopes can create new shadowed variables that only exist within that block.

---

## The Tuple Type
Tuples are a compound type that can group together values of different types into a single compound type. Tuples have a fixed length.
```rust
fn main() {
    let tup: (i32, f64, u8) = (500, 6.4, 1); // tuple declaration
    let (x, y, z) = tup; // destructuring the tuple
    println!("The value of y is: {}", y);
    
    let first_element = tup.0; // accessing tuple elements by index
    let second_element = tup.1;
    let third_element = tup.2;
    println!("The first element is: {}", first_element);
}
```
Output:
```
The value of y is: 6.4
The first element is: 500
```

## Array Type
Arrays are a collection type that can hold multiple values of the same type. Arrays have a fixed length.
```rust
fn main() {
    let arr: [i32; 5] = [1, 2, 3, 4, 5]; // array declaration
    let first = arr[0]; // accessing array elements by index
    let second = arr[1];
    println!("The first element is: {}", first);
    println!("The second element is: {}", second);
    
    let arr2 = [3; 5]; // array with same value repeated
    println!("The array with repeated values: {:?}", arr2);
}
```
Output:
```
The first element is: 1
The second element is: 2
The array with repeated values: [3, 3, 3, 3, 3]
```

## Functions
Functions are declared using the `fn` keyword. They can take parameters and return values.
```rust
fn main() {
    let result = add(5, 10); // calling the function
    println!("The sum is: {}", result);
}
fn add(x: i32, y: i32) -> i32 { // function declaration with parameters and return type
    x + y // expression that returns the sum
}
```

Output:
```
The sum is: 15
```
- Functions are defined using the `fn` keyword.
- Parameters are specified within parentheses, and the return type is indicated after the `->` symbol
- The last expression in the function body is the return value; no `return` keyword is needed unless you want to return early.

```rust
fn main() {
    let y = {
        let x = 3;
        x + 1
    };

    println!("The value of y is: {y}");
}
```
Output:
```
The value of y is: 4
```

## Control Flow
Control flow in Rust is managed using `if` expressions and loops such as `loop`, `while`, and `for`.
```rust
fn main() {
    let number = 6;

    if number % 4 == 0 {
        println!("number is divisible by 4");
    } else if number % 3 == 0 {
        println!("number is divisible by 3");
    } else if number % 2 == 0 {
        println!("number is divisible by 2");
    } else {
        println!("number is not divisible by 4, 3, or 2");
    }

    // Using a loop
    let mut count = 0;
    loop {
        count += 1;
        if count == 5 {
            break;
        }
    }
    println!("Count reached: {}", count);

    // Using a while loop
    let mut n = 3;
    while n != 0 {
        println!("{}!", n);
        n -= 1;
    }
    println!("LIFTOFF!!!");

    // Using a for loop
    let a = [10, 20, 30, 40, 50];
    for element in a.iter() {
        println!("The value is: {}", element);
    }
}
```

```rust
fn main() {
    let condition = true;
    let number = if condition { 5 } else { 6 };

    println!("The value of number is: {number}");
}
```

```rust
fn main() {

    let a: [i32; 3] = [1, 22, 3];

    for i in &a {
        println!("{}", i);
    }

}
```

```rust
fn main() {
    for i in (1..10) {
        println!("{}", i);
    }

}
```