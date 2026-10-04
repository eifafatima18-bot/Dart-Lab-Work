class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double addarea() {
    return width * height;
  }

  double perimeter() {
    return 2 * (width + height);
  }
}

void main() {
  Rectangle r1 = Rectangle(23, 34);
  r1.addarea();
  r1.perimeter();
}
