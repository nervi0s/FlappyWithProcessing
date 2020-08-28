class Bird {
  PImage bird;

  float x;
  float y;
  float diameter;
  float gravity;
  float speedY;

  Bird() {
    bird = loadImage("./img/bird.png");
    x = width/2;
    y = height/2;
    diameter = 45;
    gravity = 1;
    speedY = 0;
  }

  void move() {
    speedY = speedY + gravity;
    y = y + speedY;
    speedY *= 0.95;

    if (y >= height - diameter/2) { // Check down screen
      y = height - diameter/2;
      speedY = 0;
    }
    if (y < 0 + diameter/2) { // Check top screen
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
