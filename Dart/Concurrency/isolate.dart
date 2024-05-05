import 'dart:isolate';

int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

// Compute without blocking current isolate.
void fib40() async {
  var result = await Isolate.run(() => slowFib(50));
  print('Fib(40) = $result');
}

void main() {
  fib40();
  print('Waiting for result...');
  print('Main isolate is still running!');
}
