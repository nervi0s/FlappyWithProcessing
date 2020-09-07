class Obstacle {

  private float rectX;
  private float rect1Y;
  private float rect2Y;

  private float rectWidth = 55;
  private float rect1Height;
  private float rect2Height;

  private float separation = 150;

  private float speedX;

  private boolean isUtil; // Used to avoid massive Obstacle objects creating (used in Game class)
  private boolean canBeRemoved;
  private boolean ballPassed; // Used together with checkBallPassed() method to increase score (used in Game class)

  private ArrayList<CollisionSensor> sensors;

  public Obstacle() {

    rectX  = width + rectWidth;
    rect1Y = 0;

    rect1Height = random(height/8, height*0.75);
    rect2Height = height - (rect1Height + separation);

    rect2Y = rect1Height + separation;

    speedX = -3;

    isUtil = true;
    canBeRemoved = false;
    ballPassed  = false;

    sensors = new ArrayList<CollisionSensor>();

    for (float i = rect1Y; i < rect1Height; i += 10) { // For rectangle1 left side 
      sensors.add(new CollisionSensor(rectX  + 5, i, speedX));
    }

    for (float i = rectX  + 10; i < rectX  + rectWidth; i += 10) { // For rectangle1 down side
      sensors.add(new CollisionSensor(i, rect1Y + rect1Height - 5, speedX));
    }

    for (float i = rect2Y; i < rect2Y + rect2Height; i += 10) { // For rectangle2 left side
      sensors.add(new CollisionSensor(rectX  + 5, i + 5, speedX));
    }

    for (float i = rectX  + 10; i < rectX  + rectWidth; i += 10) { // For rectangle2 top side
      sensors.add(new CollisionSensor(i, rect2Y + 5, speedX));
    }
  }

  public float getXPosition() {
    return this.rectX;
  }

  public boolean getIsUtil() {
    return this.isUtil;
  }

  public boolean getCanBeRemoved() {
    return this.canBeRemoved;
  }

  public boolean getBallPassedStatus() {
    return this.ballPassed;
  }

  public void setUtil(boolean isUtil) {
    this.isUtil = isUtil;
  }

  public void setBallPassedStatus(boolean status) {
    ballPassed = status;
  }

  public void display() {
    stroke(0);
    strokeWeight(1);
    fill(0, 204, 0);
    rect(rectX, rect1Y, rectWidth, rect1Height, 0, 0, 10, 10);
    rect(rectX, rect2Y, rectWidth, rect2Height, 10, 10, 0, 0);
  }

  public void toLeft() {
    rectX  += speedX;

    if (rectX  < 0 - rectWidth) {
      canBeRemoved = true;
    }
  }

  public boolean checkBallPassed (Bird ball) {
    if (rectX + rectWidth < ball.GetXPosition() - ball.GetDiameter()/2) {
      return true;
    } else {
      return false;
    }
  }
}
