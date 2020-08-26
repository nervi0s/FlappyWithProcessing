class CollisionSensors {

  float x;
  float y;
  float diameter;
  float speedX;
  boolean isUtil;
  boolean isCollision;
  Obstacle ob;

  ArrayList<CollisionSensors> sensors;

  CollisionSensors(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    diameter = 10;
  }

  CollisionSensors(Obstacle obstacle) {
    ob = obstacle;

    sensors = new ArrayList<CollisionSensors>();

    speedX = ob.speedX;

    for (float i = ob.rect1Y; i < ob.rect1Height; i+=10) { // For rectangle1 left side 
      sensors.add(new CollisionSensors (ob.rect1X+5, i));
    }

    for (float i = ob.rect1X + 10; i < ob.rect1X + ob.rectWidth; i += 10) { // For rectangle1 down side
      sensors.add(new CollisionSensors (i, ob.rect1Y + ob.rect1Height));
    }

    for (float i = ob.rect2Y; i < ob.rect2Y + ob.rect2Height; i+=10) { // For rectangle2 left side
      sensors.add(new CollisionSensors (ob.rect2X + 5, i));
    }

    for (float i = ob.rect2X + 10; i < ob.rect2X + ob.rectWidth; i += 10) { // For rectangle2 top side
      sensors.add(new CollisionSensors (i, ob.rect2Y));
    }

    isUtil = true;
    isCollision = false;
  }

  void display() {
    for (CollisionSensors s : sensors) {
      fill(255, 0, 0, 50);
      circle(s.x, s.y, s.diameter);
    }
  }

  void moveWithObstacle() {
    for (CollisionSensors o : sensors) {
      o.x += speedX;
    }
  }

  void detectDistance(Bird ball) {
    for (CollisionSensors s : sensors) {
      //stroke(255, 255, 255, 100);
      //line(s.x, s.y, ball.x, ball.y);
      if (ball.diameter/2 + s.diameter/2 >= dist(ball.x, ball.y, s.x, s.y)) {
        //isCollision = true;
      }
    }
    if (ob.rect1X + ball.diameter/2 + ob.rectWidth +diameter < ball.x) {
      isUtil = false;
    }
  }
}
