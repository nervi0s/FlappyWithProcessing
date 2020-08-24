class CollisionSensors {

  float x;
  float y;
  float diameter;
  float speedX;
  boolean isUtil;

  Obstacle ob;

  ArrayList<CollisionSensors> sensors;

  CollisionSensors(float tempX, float tempY) {
    diameter = 10;
    x = tempX;
    y = tempY;
  }

  CollisionSensors(Obstacle obstacle) {
    ob = obstacle;
    sensors = new ArrayList<CollisionSensors>();
    speedX = obstacle.speedX;
    for (float i = obstacle.rect1Y; i < obstacle.rect1Height; i+=10) { // For rectangle1 left side 
      sensors.add(new CollisionSensors (obstacle.rect1X, i));
    }

    for (float i = obstacle.rect1X; i < obstacle.rect1X + obstacle.rectWidth; i+=10) { // For rectangle1 down side
      sensors.add(new CollisionSensors (i, obstacle.rect1Y + obstacle.rect1Height));
    }

    for (float i = obstacle.rect2Y; i < height; i+=10) { // For rectangle2 left side
      sensors.add(new CollisionSensors (obstacle.rect2X, i));
    }
    for (float i = obstacle.rect2X; i < obstacle.rect2X + obstacle.rectWidth; i+=10) { // For rectangle2 top side
      sensors.add(new CollisionSensors (i, obstacle.rect2Y));
    }
    diameter = 10;
    isUtil = true;
  }

  void display() {
    for (CollisionSensors o : sensors) {
      fill(255, 0, 0, 50);
      circle(o.x, o.y, diameter);
    }
  }

  void moveWithObstacle() {
    for (CollisionSensors o : sensors) {
      o.x += speedX;
    }
  }

  void detectDistance(Bird ball) {
    for (CollisionSensors s : sensors) {
      stroke(255, 255, 255, 100);
      line(s.x, s.y, ball.x, ball.y);

      if (ball.diameter/2 + s.diameter/2 >= dist(ball.x, ball.y, s.x, s.y)) {
        // frameRate(0);
      }
    }

    if (ob.rect1X + ball.diameter/2 + ob.rectWidth +diameter < ball.x) {
      isUtil = false;
    }
  }
}
