class CollisionSensors {

  float x;
  float y;
  float diameter;
  float speedX;
  boolean isUtil;
  boolean isCollision;

  CollisionSensors(float tempX, float tempY, float speed) {
    x = tempX;
    y = tempY;
    diameter = 10;
    speedX = speed;
    isUtil = true;
    isCollision = false;
  }

  void display() {
    stroke(0);
    fill(255, 0, 0, 65);
    circle(x, y, diameter);
  }

  void moveWithObstacle() {
    x += speedX;
  }

  void detectDistance(Bird ball) {
    //stroke(0, 0, 0, 100);
    //line(x, y, ball.x, ball.y); // Line for visualize the distance
    if (ball.diameter/2 + diameter/2 >= dist(ball.x, ball.y, x, y)) {
      stroke(255, 0, 0);
      line(x, y, ball.x, ball.y); // Turn to color red if collision is detected
      //frameRate(0); // For debugging purposes
      isCollision = true;
    }
    if (x + diameter/2 < ball.x - ball.diameter/2) {
      isUtil = false;
    }
  }
}
