typedef callback<T> = void Function(bool err, T result);

void login(String username, String password, callback<String> cb) {
  if (username == "admin" && password == "admin") {
    cb(false, "Login successful");
  } else {
    cb(true, "Login failed");
  }
}

void main() {
  dynamic abc = 10;
  abc = "Hello";
}
