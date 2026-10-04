mixin Swimmable {
  void swim() {
    print("I can swim!");
  }
}

class Fish with Swimmable {}

class Robot with Swimmable {}

void main() {
  Fish fish = Fish();
  Robot robot = Robot();

  fish.swim();
  robot.swim();
}
