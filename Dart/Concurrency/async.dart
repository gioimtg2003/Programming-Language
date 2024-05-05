import 'dart:io';

Future<void> _sleep() {
  return Future.delayed(Duration(seconds: 5));
}

void main() {
  print('Hello World1');
  _sleep();
  _sleep();
  _sleep();

  print('Hello World');
}
