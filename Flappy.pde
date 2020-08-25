PImage bird;
PImage pipe;
PImage bg;
float bgX;

Bird b;

ArrayList<Obstacle> obstacles;
ArrayList<CollisionSensors> sensors;

void setup() {
  size(displayWidth, displayHeight);

  bird = loadImage("bird.png");
  pipe = loadImage("pipe_body.png");
  bg = loadImage("background.png");

  b = new Bird();

  obstacles = new ArrayList<Obstacle>();
  obstacles.add(new Obstacle());
  sensors = new ArrayList<CollisionSensors>();
  sensors.add(new CollisionSensors(obstacles.get(0)));
}

void draw() {
  background(55);

  image(bg, bgX, 0, bg.width, displayHeight); // Background display
  bgX -= 2; // background velocity

  if (bgX <= -bg.width + width) {  // Infinite loop for background
    image(bg, bgX + bg.width, 0, bg.width, displayHeight);
    if (bgX <= -bg.width) {
      bgX = 0;
    }
  }

  b.display();
  b.move();

  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);

    o.display();
    o.toLeft();

    if (o.rect1X < width/2 && o.isUtil) {
      o.isUtil = false;
      obstacles.add(new Obstacle());
      sensors.add(new CollisionSensors( obstacles.get(i+1)));
    }

    if (o.canBeRemoved) {
      obstacles.remove(i);
    }
  }

  for (int j = sensors.size() - 1; j >= 0; j--) {
    CollisionSensors s = sensors.get(j);

    s.display();
    s.moveWithObstacle();
    s.detectDistance(b);
    if (!s.isUtil) {
      sensors.remove(j);
    }
  }
  //println(obstacles.size() + " " + sensors.size());
}

void mousePressed() {
  b.speedY += - b.gravity * 15;
}
