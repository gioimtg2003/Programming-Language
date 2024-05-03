(int, int) sum(int a) {
  return (a, a);
}

({int r, int g, int b}) color(String name) {
  switch (name) {
    case 'red':
      return (r: 255, g: 0, b: 0);
    case 'green':
      return (r: 0, g: 255, b: 0);
    case 'blue':
      return (r: 0, g: 0, b: 255);
    default:
      return (r: 0, g: 0, b: 0);
  }
}

(String name, int age) nameAge(Map<String, dynamic> person) {
  return (person["name"] as String, person["age"] as int);
}

void main() {
  for (int i = 1; i <= 10000000; i++) {
    if (i % 10000000 == 0) {
      print(i);
    }
  }
  print(color("red").r);
  var record = sum(2);
  print(record.$2);

  var person = nameAge({"name": "John", "age": 30});

  print(person);
}
