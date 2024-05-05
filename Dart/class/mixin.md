-   Giống như kế thừa, mixin cho phép bạn tái sử dụng một class ở nhiều class khác nhau.

```dart
class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
```

-   Một mixin không thể được sử dụng một mình, mà phải được kết hợp với một class khác. Để tạo một mixin, bạn sử dụng từ khóa `mixin` thay vì `class`.

```dart
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
```

-   `on` keyword cho phép bạn áp dụng mixin cho một class cụ thể.

```dart
mixin Gaming on Person {

}

class Person {
  String name;
  Person(this.name);
}
// A Gamer is a Person who can play games.
class Gamer extends Person with Gaming {
  Gamer(String name) : super(name);
}
```
