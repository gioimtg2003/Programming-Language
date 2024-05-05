const String _name = 'John Doe';
const int _age = 30;

class Person {
  final String name;
  final int age;
  Person(this.name, this.age);

  Person.originPerson()
      : name = _name,
        age = _age;
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

void main(List<String> args) {
  var person = Person.originPerson();
  print(person.name);
  print(person.age);

  Person person2 = Person('Jane Doe', 25);
  print(person2.name);
  print(person2.age);
  print(person.runtimeType);

  var logger = Logger('UI');
  logger.log('Button clicked');
  var logger2 = Logger('UI');
  logger2.log('Button clicked');
  var logger3 = Logger.fromJson({'name': 'UI'});
  logger3.log('Button clicked');
  print(logger == logger2);
  print(logger == logger3);

  // Note factory constructor is not access to this
}
