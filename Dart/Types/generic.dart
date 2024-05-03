T sum<E, T>(E a, E b) {
  if (E == int) {
    return ((a as int) + (b as int) as T);
  }
  return "Unsupported type" as T;
}

void main() {
  print(sum<int, String>(3, 3));
}
