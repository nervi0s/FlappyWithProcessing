Bird b;
Obstacle o;
CollisionSensors c;

void setup() {
  size(700, 500);

  b = new Bird();
  o = new Obstacle();
  c = new CollisionSensors(o);
}

void draw() {
  background(55);

  b.display();
  b.move();


  o.display();
  o.toLeft();

  c.display();
  c.moveWithObstacle();
  c.detectDistance(b);
}

void mousePressed() {
  b.y = b.y - 25;
}
