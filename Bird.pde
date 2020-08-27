class Bird {
  PImage bird;

  float x;
  float y;
  float diameter;
  float gravity;
  float speedY;

  Bird() {
    bird = loadImage("bird.png");
    x = width/2;
    y = height/2;
    diameter = 80;
    gravity = 2;
    speedY = 0;
  }

  void move() {
    speedY = speedY + gravity;
    y = y + speedY;
    speedY *= 0.95;

    if (y >= height - diameter/2) {
      y = height - diameter/2;
      speedY = 0;
    }
    if (y < 0 + diameter/2) {
      y = 0 + diameter/2;
      speedY = 0;
    }
    //println(speedY + " " + gravity);
  }

  void display() {
    fill(255, 128, 191);
    circle(x, y, diameter);
    imageMode(CENTER);
    image(bird, (int)x, (int)y, diameter+10, diameter+10);
  }
}
