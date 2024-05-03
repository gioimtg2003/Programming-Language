## Similar typescript

```dart
class Box<T> {
  final T value;
  const Box(this.value);
}


void main() {
  final box = Box<int>(10);
  print(box.value); // 10
}
```
