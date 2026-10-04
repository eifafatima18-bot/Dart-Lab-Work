bool isPalindrome(String text) {
  String lowerText = text.toLowerCase();
  String reversedText = lowerText.split('').reversed.join('');

  return lowerText == reversedText;
}

void main() {
  print(isPalindrome('level'));
  print(isPalindrome('Flutter'));
  print(isPalindrome('Madam'));
}
