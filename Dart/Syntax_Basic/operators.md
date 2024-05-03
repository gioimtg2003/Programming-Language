## Operators

## Type test operators

| Operators | Meaning                                   |
| --------- | ----------------------------------------- |
| as        | Type Cast                                 |
| is        | True if the object has the specified type |
| is!       |                                           |

```dart

//type check

void main() {
  var num = 5;
  print(num is int); // true
  print(num is! int); // false
}

//typeCast
(employee as Person).firstName = 'Bob';
```
