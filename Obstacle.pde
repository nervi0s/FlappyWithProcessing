class Obstacle {

  float rect1X;
  float rect1Y;

  float rect2X;
  float rect2Y;

  float separation = 150;

  float rectWidth = 55;
  float rect1Height;
  float rect2Height;

  float speedX;

  Obstacle() {

    rect1Height = random(height/8, height*0.75);

    rect1X = width - rectWidth;
    rect1Y = 0;

    rect2X = rect1X;
    rect2Y = rect1Height + separation;

    rect2Height = height - rect2Y;

    speedX = -1;
  }

  void display() {
    fill(255);
    rect(rect1X, rect1Y, rectWidth, rect1Height);
    rect(rect2X, rect2Y, rectWidth, rect2Height);
  }

  void toLeft() {
    rect1X += speedX;
    rect2X += speedX;
  }
}
