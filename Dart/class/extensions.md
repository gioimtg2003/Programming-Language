## Extensions

-   Extensions are a way to add new functionality to existing classes, structures, enumerations, or protocols.

-   Extensions in Dart are similar to extensions in Swift.

```dart
extension StringExtension on String {
  String get capitalize => "${this[0].toUpperCase()}${this.substring(1)}";
}

void main() {
  String name = "john";
  print(name.capitalize); // John
}
```
