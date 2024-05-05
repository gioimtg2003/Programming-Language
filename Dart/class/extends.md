## noSuchMethod()

-   To detect or react whenever code attempts to use a non-existent member of an object, you can override the `noSuchMethod()` method.

```dart
class A {
  @override
  noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' + invocation.memberName.toString());
  }
}


void main() {
  var a = A();
  a.someMethod(); // You tried to use a non-existent member: Symbol("someMethod")
}
```
