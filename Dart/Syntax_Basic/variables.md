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
