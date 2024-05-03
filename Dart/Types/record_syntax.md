## Record Syntax

-   Record syntax is a way to define a class with named fields.

    ```dart

    class Point {
    double x;
    double y;
    }

    void main() {
    var p = Point();
    p.x = 10;
    p.y = 20;
    print(p.x);
    }

    ```

-   use `(int, int)` statements are record type annotations.
    ```dart
    (int, int) sum(Point p) {
      return (p.x, p.y);
    }
    ```

## Multiple returns

-   Dart does not support multiple returns, but you can return a record type.

    ```dart
    (int, int) sumAndProduct(int a, int b) {
      return (a + b, a * b);
    }
    ```

-   You can also use a record type as a return type.

    ```dart
    class SumAndProduct {
      int sum;
      int product;
    }

    SumAndProduct sumAndProduct(int a, int b) {
      var result = SumAndProduct();
      result.sum = a + b;
      result.product = a * b;
      return result;
    }

    // Returns multiple values in a record:
    (String name, int age) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
    }
    final json = <String, dynamic>{
    'name': 'Dash',
    'age': 10,
    'color': 'blue',
    };
    var (name, age) = userInfo(json);
    ```
