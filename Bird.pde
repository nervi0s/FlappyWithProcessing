class Bird {
  float x;
  float y;
  float diameter;
  float speedY;

  Bird() {
    x = width/2;
    y = height/2;
    diameter = 80;
    speedY = 1;
  }

  void move() {
    y = y + speedY;
  }

  void display() {
    fill(0, 255, 0);
    circle(x, y, diameter);
  }
}
