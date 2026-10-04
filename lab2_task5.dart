class InvalidOperationException implements Exception {
  String message;

  InvalidOperationException(this.message);
}

double safeDivide(int a, int b) {
  if (b == 0) {
    throw InvalidOperationException('Cannot divide by zero');
  }

  return a / b;
}

void main() {
  try {
    print('Result: ${safeDivide(10, 2)}');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('First operation completed.');
  }

  try {
    print('Result: ${safeDivide(10, 0)}');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Second operation completed.');
  }
}
