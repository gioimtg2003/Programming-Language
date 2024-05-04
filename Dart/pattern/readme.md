## Overview

## Matching

```dart
const a = 'a';
const b = 'b';
switch (obj) {
  // List pattern [a, b] matches obj first if obj is a list with two fields,
  // then if its fields match the constant subpatterns 'a' and 'b'.
  case [a, b]:
    print('$a, $b');
}
```

## Destructuring

```dart
var numList = [1, 2, 3];
var [a, b, c] = numList;
print('$a, $b, $c');
```

## Variable assignment

```dart
var (a,b) = ("hello", "world");
(a, b) = (b, a);
print('$a, $b'); // world, hello
```

## Switch statements and expressions

-   Logical OR

```dart
var obj = 'a';
switch (obj) {
  case 'a':
  case 'b' || 'c':
    print('c or b');
    break;
  default:
    print('neither a nor b');
}
```

-   Guard clauses

```dart
var obj = 'a';
switch (obj) {
  case 'a' if obj == 'a':
    print('a');
    break;
  case 'b' if obj == 'b':
    print('b');
    break;
  default:
    print('neither a nor b');
}
```

```dart
switch (pair) {
  case (int a, int b):
    if (a > b) print('First element greater');
  // If false, prints nothing and exits the switch.
  case (int a, int b) when a > b:
    // If false, prints nothing but proceeds to next case.
    print('First element greater');
  case (int a, int b):
    print('First element not greater');
}
```

## Validating incoming json

```dart

var json = {
  'user': ['Lily', 13]
};
var {'user': [name, age]} = json;

if (json is Map<String, Object?> &&
    json.length == 1 &&
    json.containsKey('user')) {
  var user = json['user'];
  if (user is List<Object> &&
      user.length == 2 &&
      user[0] is String &&
      user[1] is int) {
    var name = user[0] as String;
    var age = user[1] as int;
    print('User $name is $age years old.');
  }
}


```
