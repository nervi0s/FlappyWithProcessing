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

  boolean isUtil;
  boolean canBeRemoved;

  ArrayList<CollisionSensors> sensors;

  Obstacle() {

    rect1Height = random(height/8, height*0.75);

    rect1X = width + rectWidth;
    rect1Y = 0;

    rect2X = rect1X;
    rect2Y = rect1Height + separation;

    rect2Height = height - (rect1Height + separation);

    speedX = -3;
    isUtil = true;
    canBeRemoved = false;


    sensors = new ArrayList<CollisionSensors>();


    for (float i = rect1Y; i < rect1Height; i+=10) { // For rectangle1 left side 
      sensors.add(new CollisionSensors (rect1X+5, i));
    }

    for (float i = rect1X + 10; i < rect1X + rectWidth; i += 10) { // For rectangle1 down side
      sensors.add(new CollisionSensors (i, rect1Y + rect1Height));
    }

    for (float i = rect2Y; i < rect2Y + rect2Height; i+=10) { // For rectangle2 left side
      sensors.add(new CollisionSensors (rect2X + 5, i));
    }
    for (float i = rect2X + 10; i < rect2X + rectWidth; i += 10) { // For rectangle2 top side
      sensors.add(new CollisionSensors (i, rect2Y));
    }
  }

  void display() {
    fill(255);
    rect(rect1X, rect1Y, rectWidth, rect1Height);
    rect(rect2X, rect2Y, rectWidth, rect2Height);
    imageMode(CORNER);
    //image(pipe, rect1X, rect1Y, rectWidth, rect1Height+5);
    //image(pipe, rect2X, rect2Y-4, rectWidth, rect2Height+5);
  }

  void toLeft() {
    rect1X += speedX;
    rect2X += speedX;

    if (rect1X < 0 - rectWidth) {
      canBeRemoved = true;
    }
  }
}
