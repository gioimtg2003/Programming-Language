# Variables

## Variable Declaration

-   Variables are declared using the `var` keyword.

-   The type of the variable is inferred from the value assigned to it.

```dart
var name = 'John Doe';
String name = 'John Doe';
```

## Null Safety

-   Dart 2.12 introduced null safety.

```dart
String? name = null;
String? data = null;
```

## Late Variables

-   Late variables are initialized after their declaration.

```dart
late String name;
name = 'John Doe';
```

-   Note : `late` variables must be initialized before they are accessed.

## Final and Const

-   `final` and `const` are used to declare constants.

```dart

final String name = 'John Doe';
const String name = 'John Doe';
```

-   You can define constants that use `type checks and casts`

    ```dart
    const Object i = 3; // Where i is a const Object with an int value
    const list = [i as int]; // Use a type cast.
    const map = {if (i is int) i: "int"}; // Use is and collection if.
    ```
