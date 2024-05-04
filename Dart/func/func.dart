String say(String from, String msg, [List<String>? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a ${device.join(' and a ')}';
  }
  return result;
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

void main(List<String> args) {
  print(naturalsTo(10));
  print(naturalsTo(10));
  assert(1 == 2);
  print(naturalsTo(10));
  print(naturalsTo(10));
  asynchronousNaturalsTo(10);
  print(asynchronousNaturalsTo(10));
  print(asynchronousNaturalsTo(10));
  print(asynchronousNaturalsTo(10));
  print(asynchronousNaturalsTo(10));
  print(asynchronousNaturalsTo(10));
  for (var n in naturalsTo(5)) {
    print(n);
  }
}
