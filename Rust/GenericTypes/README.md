## Generic Types

In Rust, generic types allow you to write flexible and reusable code by defining functions, structs, enums, and traits that can operate on different data types without being tied to a specific one. This is achieved using type parameters, which are specified within angle brackets (`<>`).
### Generic Functions
```rust
fn main() {
    let result = add(10, 5);
    println!("The sum is: {}", result);
}
fn add<T: std::ops::Add<Output = T>>(a: T, b: T) -> T {
    a + b
}
```
Output:
```
The sum is: 15
```
- The function `add` is defined with a generic type parameter `T`.
- The `T: std::ops::Add<Output = T>` syntax specifies that `
- T` must implement the `Add` trait, allowing the use of the `+` operator.

### Generic Structs
```rust
struct Point<T> {
    x: T,
    y: T,
}
fn main() {
    let int_point = Point { x: 5, y: 10 };
    let float_point = Point { x: 1.0, y: 4.0 };

    println!("Integer Point: ({}, {})", int_point.x, int_point.y);
    println!("Float Point: ({}, {})", float_point.x, float_point.y);
}
```
Output:
```
Integer Point: (5, 10)
Float Point: (1, 4)
```
- The `Point` struct is defined with a generic type parameter `T`, allowing it to hold coordinates of any type.
- Instances of `Point` can be created with different types, such as integers and floats.

### Generic Enums
```rust
enum Option<T> {
    Some(T),
    None,
}
fn main() {
    let some_number = Option::Some(5);
    let no_number: Option<i32> = Option::None;

    match some_number {
        Option::Some(value) => println!("Got a number: {}", value),
        Option::None => println!("No number"),
    }

    match no_number {
        Option::Some(value) => println!("Got a number: {}", value),
        Option::None => println!("No number"),
    }
}
```
Output:
```
Got a number: 5
No number
```
- The `Option` enum is defined with a generic type parameter `T`, allowing it to represent either a value of type `T` or no value at all.
- Pattern matching is used to handle the different variants of the `Option` enum.
- Generic types enhance code reusability and flexibility in Rust.

## Generic Traits
```rust
trait Summary {
    fn summarize(&self) -> String;
}
struct NewsArticle {
    headline: String,
    content: String,
}
impl Summary for NewsArticle {
    fn summarize(&self) -> String {
        format!("{} - {}", self.headline, self.content)
    }
}

fn main() {
    let article = NewsArticle {
        headline: String::from("Breaking News"),
        content: String::from("Rust is awesome!"),
    };
    println!("Summary: {}", article.summarize());
}
```
Output:
```

Summary: Breaking News - Rust is awesome!
```
- The `Summary` trait is defined with a method `summarize`.
- The `NewsArticle` struct implements the `Summary` trait, providing a specific implementation of the `summarize` method.
- Traits can be used to define shared behavior across different types in a generic way.
- Generic types and traits are powerful features in Rust that promote code reusability, type safety, and flexibility.

## Trait parameters
```rust

pub fn notify(item: &impl Summary) {
    println!("Breaking news! {}", item.summarize());
}
```
- The `notify` function takes a reference to any type that implements the `Summary` trait.
- This allows `notify` to work with different types that share the same behavior defined by the `Summary` trait.
- The `impl Trait` syntax is a concise way to specify trait bounds for function parameters.
- This promotes code reusability and flexibility while ensuring type safety.
- You can also use generic type parameters with trait bounds:
```rust
pub fn notify<T: Summary>(item: &T) {
    println!("Breaking news! {}", item.summarize());
}
```
- This version of `notify` achieves the same functionality using a generic type parameter `T` with a trait bound.

- Multi trait bounds can be specified using the `+` syntax:
```rust
pub fn notify(item: &(impl Summary + std::fmt::Display)) {
    println!("Breaking news! {}", item.summarize());
}
```
- This function requires that the `item` implements both the `Summary` and `Display` traits.

### Using where Clauses for Clarity
```rust
pub fn notify<T>(item: &T)
where
    T: Summary + std::fmt::Display,
{
    println!("Breaking news! {}", item.summarize());
}
```
- The `where` clause is used to specify trait bounds in a more readable way, especially when there are multiple bounds or complex constraints.
- This enhances code clarity and maintainability.
- Using generic types and traits effectively allows for writing flexible, reusable, and type-safe code in Rust.

