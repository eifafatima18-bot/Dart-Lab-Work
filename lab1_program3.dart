void main() {
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0) {
      print('fizz');
    } else if (i % 5 == 0) {
      print('bizz');
    } else if (i % 3 == 0 && i % 5 == 0) {
      print('fizzbizz');
    } else {
      print('$i');
    }
  }
}
