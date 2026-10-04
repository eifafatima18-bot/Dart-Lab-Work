bool isEven(int n) {
  bool even = true;
  bool odd = false;

  if (n % 2 == 0) {
    return even;
  } else {
    return odd;
  }
}

void main() {
  print('Ans :${isEven(4)}');
  print('Ans :${isEven(5)}');
  print('Ans :${isEven(49)}');
}
