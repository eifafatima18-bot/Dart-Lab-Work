void greetUser(String? username) {
  String name = username ?? 'Guest';
  print('Welcome, $name!');
}

void main() {
  greetUser('Eiman');
  greetUser(null);
}
