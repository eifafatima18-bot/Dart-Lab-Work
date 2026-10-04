abstract class Shape {
  double area();
}

class Square extends Shape {
  double side;

  Square(this.side);

  @override
  double area() {
    return side * side;
  }
}

class Triangle extends Shape {
  double base;
  double height;

  Triangle(this.base, this.height);

  @override
  double area() {
    return 0.5 * base * height;
  }
}

void main() {
  Square square = Square(5);
  Triangle triangle = Triangle(4, 6);

  print('Area of Square: ${square.area()}');
  print('Area of Triangle: ${triangle.area()}');
}
