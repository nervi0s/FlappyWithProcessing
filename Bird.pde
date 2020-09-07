class Bird {

  private PImage bird;
  private float x;
  private float y;
  private float diameter;
  private float gravity;
  private float speedY;

  public Bird() {
    bird = loadImage("./img/bird.png");
    x = width/2;
    y = height/2;
    diameter = 45;
    gravity = 1;
    speedY = 0;
  }

  public float GetXPosition() {
    return this.x;
  }

  public float GetYPosition() {
    return this.y;
  }

  public float GetDiameter() {
    return this.diameter;
  }

  public void setSpeedYOnClic() { // Move bird to top by clic
    speedY += - gravity * 18;
  }

  public void move() { // Move always to bottom edge
    speedY = speedY + this.gravity;
    y = y + speedY;
    speedY *= 0.95;

    if (y >= height - diameter/2) { // Check screen bottom edge
      y = height - diameter/2;
      speedY = 0;
    }
    if (y < 0 + diameter/2) { // Check screen top edgde
      y = 0 + diameter/2;
      speedY = 0;
    }
    //println(speedY + " " + gravity);
  }

  public void display() {
    fill(255, 128, 191);
    circle(x, y, diameter);
    imageMode(CENTER);
    image(bird, (int)x, (int)y, diameter+10, diameter+10);
  }
}
