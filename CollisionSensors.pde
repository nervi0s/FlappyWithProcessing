class CollisionSensor {

  private float x;
  private float y;
  private float diameter;
  private float speedX;
  private boolean isUtil; // Used to remove instanced objects if they aren't used (if the ball passes the object)
  private boolean isCollision;

  public CollisionSensor(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    diameter = 10;
    speedX = speed;
    isUtil = true;
    isCollision = false;
  }

  public boolean getIsUtil() {
    return this.isUtil;
  }

  public boolean getIsCollision() {
    return this.isCollision;
  }

  public void display() {
    stroke(0);
    fill(255, 0, 0, 65);
    circle(x, y, diameter);
  }

  public void moveWithObstacle() {
    x += speedX;
  }

  public void detectDistance(Bird ball) {
    //stroke(0, 0, 0, 100);
    //line(x, y, ball.GetXPosition(), ball.GetYPosition()); // Line for visualize the distance
    if (ball.GetDiameter()/2 + diameter/2 >= dist(ball.GetXPosition(), ball.GetYPosition(), x, y)) {
      //stroke(255, 0, 0);
      //line(x, y, ball.GetXPosition(), ball.GetYPosition()); // Turn to color red if collision is detected
      //frameRate(0); // For debugging purposes
      isCollision = true;
    }
    if (x + diameter/2 < ball.GetXPosition() - ball.GetDiameter()/2) {
      isUtil = false;
    }
  }
}
