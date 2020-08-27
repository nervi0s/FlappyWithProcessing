class Obstacle {

  float rectX;
  float rect1Y;
  float rect2Y;

  float rectWidth = 100;
  float rect1Height;
  float rect2Height;

  float separation = 350;

  float speedX;

  boolean isUtil;
  boolean canBeRemoved;
  boolean ballPassed;

  ArrayList<CollisionSensors> sensors;

  Obstacle() {

    rectX = width + rectWidth;
    rect1Y = 0;

    rect1Height = random(height/8, height*0.75);
    rect2Height = height - (rect1Height + separation);

    rect2Y = rect1Height + separation;

    speedX = -3;

    isUtil = true;
    canBeRemoved = false;
    ballPassed  = false;

    sensors = new ArrayList<CollisionSensors>();

    for (float i = rect1Y; i < rect1Height; i += 10) { // For rectangle1 left side 
      sensors.add(new CollisionSensors (rectX + 5, i, speedX));
    }

    for (float i = rectX + 10; i < rectX + rectWidth; i += 10) { // For rectangle1 down side
      sensors.add(new CollisionSensors (i, rect1Y + rect1Height - 5, speedX));
    }

    for (float i = rect2Y; i < rect2Y + rect2Height; i += 10) { // For rectangle2 left side
      sensors.add(new CollisionSensors (rectX + 5, i + 5, speedX));
    }
    for (float i = rectX + 10; i < rectX + rectWidth; i += 10) { // For rectangle2 top side
      sensors.add(new CollisionSensors (i, rect2Y + 5, speedX));
    }
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(0, 204, 0);
    rect(rectX, rect1Y, rectWidth, rect1Height, 0, 0, 10, 10);
    rect(rectX, rect2Y, rectWidth, rect2Height, 10, 10, 0, 0);
  }

  void toLeft() {
    rectX += speedX;

    if (rectX < 0 + rectWidth) {
      canBeRemoved = true;
    }
  }

  Boolean checkBallPassed (Bird ball) {
    if (rectX + rectWidth < ball.x - ball.diameter/2) {
      return true;
    } else {
      return false;
    }
  }
}
