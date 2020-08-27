class CollisionSensors {

  float x;
  float y;
  float diameter;
  float speedX;
  boolean isUtil;
  boolean isCollision;

  Obstacle ob;


  CollisionSensors(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    diameter = 10;
    isUtil = true;
    isCollision = false;
    speedX = -3;
  }


  void display() {

    fill(255, 0, 0, 50);
    circle(x, y, diameter);
  }

  void moveWithObstacle() {

    x += speedX;
  }

  void detectDistance(Bird ball) {

    //stroke(255, 255, 255, 100);
    //line(s.x, s.y, ball.x, ball.y);
    if (ball.diameter/2 + diameter/2 >= dist(ball.x, ball.y, x, y)) {
      //isCollision = true;
    }

    if (x + ball.diameter/2 + 55 +diameter < ball.x) { //55 rectWidth [] ToDo
      isUtil = false;
    }
  }
}
