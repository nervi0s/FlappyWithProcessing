Bird b;

ArrayList<Obstacle> obstacles;
ArrayList<CollisionSensors> sensors;

void setup() {
  size(700, 500);

  b = new Bird();


  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle());
  sensors = new ArrayList<CollisionSensors>();
  sensors.add(new CollisionSensors(obstacles.get(0)));
}

void draw() {
  background(55);

  b.display();
  b.move();



  // c.display();
  // c.moveWithObstacle();
  //c.detectDistance(b);

  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);

    o.display();
    o.toLeft();

    if (o.rect1X < 100) {
      obstacles.remove(i);
      sensors.remove(i);
      obstacles.add(new Obstacle());
      sensors.add(new CollisionSensors( obstacles.get(i)));
    }
  }

  for (int j = sensors.size() - 1; j >= 0; j--) {
    CollisionSensors s = sensors.get(j);

    s.display();
    s.moveWithObstacle();
    s.detectDistance(b);
  }

  println(sensors.size()+" "+ obstacles.size());
}

void mousePressed() {
  b.y = b.y - 25;
}
