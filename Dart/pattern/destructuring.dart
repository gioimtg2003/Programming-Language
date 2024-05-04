void main(List<String> args) {
  Map<String, dynamic> person = {
    'name': 'John Doe',
    'age': 30,
    'isEmployed': true,
    'address': {
      'street': '123 Main Street',
      'city': 'Nairobi',
      'country': 'Kenya'
    }
  };

  // Destructuring
  print(person.entries);
  for (var MapEntry(key: key, value: value) in person.entries) {
    print('$key :::: $value ');
  }
}
