## Using librairies

```dart
import 'dart:math';
import 'dart:io';
import 'dart:convert';
```

```dart

import 'package:mylib/mylib.dart';

import 'package:mylib/mylib.dart' as mylib;
// mylib.foo();
import 'package:mylib/mylib.dart' hide foo;
// foo(); // Error
import 'package:mylib/mylib.dart' show foo;
```
