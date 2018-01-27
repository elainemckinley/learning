# Syntax and Semantics

## Variable bindings
`let x = 5;`

Patterns: `let (x, y) = (1, 2);`

Explicit typing: `let x: i32 = 5;`

Mutability: `let mut x = 5;` (Rust bindings are immutable by default)

Scope: Rust bindings have block scope.

Shadowing:
```
let x: i32 = 32;

let x = "I am now bound to text!";
```

## Functions
`fn main() {}`

Arguments: `fn print_number(x: i32) {}`

* Bindings cannot be inferred from function declarations.

Returning: `fn add_once(x: i32) -> i32 {x+1}`

* Note: no semicolon; expression, not statement

Early returns: `return x + 1;`

* Expressions vs. Statements: Only 2 kinds of statements, and everything else is an expression:
  * let statements: declaring a variable binding
  * expression statements: turns any expression into a statement

* Divergent functions: a function that does not return. `fn diverges() -> ! { panic!("This function never returns!"); }`

Note: There's some information about the RUST_BACKTRACE env variable that could be useful in this section.

* Function pointers: variable bindings which point to functions

`let f: fn(i32) -> i32;`

`let f: plus_one;`

## Primitive types

* bool
* char (Unicode)
* Numeric types:
  * Signed: i8, i16, i32, i64
  * Unsigned: u8, u16, u32, u64
  * Variable-sized: isize, usize
  * Floating point: f32, f64
* Arrays: size must be defined at compile-time
* Slices: a reference/view into another data structure
  * Slices have type &[T].
```
let a = [0, 1, 2, 3, 4];
let complete = &a[..]; // A slice containing all of the elements in a
let middle = &a[1..4]; // A slice of a: only the elements 1, 2, and 3
```

* str
* Tuples: an ordered list of fixed size. Can contain different types. `let x = (1, "hello");`

```
let tuple = (1, 2, 3);

let x = tuple.0;
let y = tuple.1
```

* Functions

## Comments
* //  : line comment
* /// : doc comment. Supports markdown inside.
* //! : comments containing items.

## If

* Rust `if` is an expression, meaning that the body can return something.

```
let x = if y == 4 {
  15
} else {
  10
}
```

## Loops
* Infinite loop: `loop {}`
* While loop: `while !done {}`
* For loop:
  * `for (x=0; x<10; x++) {}`
  * `for x in 0..10 {}`
  * `for (i, timesLooped) in (5..10).enumerate() {}`
  * `for (linenumber, line) in lines.enumerate() {}`

Ending iteration early: `break;`

Loop labels: Explicitly state which loop you're breaking out of/continuing/etc.

```
'outer: for x in 0..10 {
    'inner: for y in 0..10 {
        if x % 2 == 0 { continue 'outer; } // continues the loop over x
        if y % 2 == 0 { continue 'inner; } // continues the loop over y
        println!("x: {}, y: {}", x, y);
    }
}
```
