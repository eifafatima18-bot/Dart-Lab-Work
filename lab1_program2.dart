double calculate(double a, double b, String operation) {
  if (operation == '+') {
    return a + b;
  } else if (operation == '-') {
    return a - b;
  } else if (operation == '*') {
    return a * b;
  } else if (operation == '/') {
    return a / b;
  }

  return 0.0;
}

void main() {
  print(calculate(2, 4, '+'));
  print(calculate(2, 4, '-'));
  print(calculate(2, 4, '*'));
}
