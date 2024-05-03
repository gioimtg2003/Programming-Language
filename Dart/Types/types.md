## Number

```dart
void main() {
  num x = 10;
  double y = 10.0;
  int z = 10;
  var a = 10;
  print(x);

  // parser

    var one = int.parse('1');
    var onePointOne = double.parse('1.1');
    print(one);
}
```

## String

## Boolean

## List

## Set

```dart

void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);
  print(elements);
}

```

## Map

```dart

void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };
  print(gifts['first']);
}

```
