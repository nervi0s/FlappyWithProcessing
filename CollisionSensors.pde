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
    speedX = obstacle.speedX;
    for (float i = obstacle.rect1Y; i < obstacle.rect1Height; i+=10) { // For rectangle1 left side 
      sensors.add(new CollisionSensors (obstacle.rect1X+5, i));
    }

    for (float i = obstacle.rect1X + 10; i < obstacle.rect1X + obstacle.rectWidth; i += 10) { // For rectangle1 down side
      sensors.add(new CollisionSensors (i, obstacle.rect1Y + obstacle.rect1Height));
    }

    for (float i = obstacle.rect2Y; i < height; i+=10) { // For rectangle2 left side
      sensors.add(new CollisionSensors (obstacle.rect2X + 5, i));
    }
    for (float i = obstacle.rect2X + 10; i < obstacle.rect2X + obstacle.rectWidth; i += 10) { // For rectangle2 top side
      sensors.add(new CollisionSensors (i, obstacle.rect2Y));
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
        isCollision = true;
      }
    }
    if (ob.rect1X + ball.diameter/2 + ob.rectWidth +diameter < ball.x) {
      isUtil = false;
    }
  }
}
