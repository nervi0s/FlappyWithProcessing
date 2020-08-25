PImage bird;
PImage pipe;
PImage bg;
float bgX;

ArrayList<Game> games;
Score score = new Score();

void setup() {
  size(700, 500);

  bird = loadImage("./img/bird.png");
  pipe = loadImage("./img/pipe_body.png");
  bg = loadImage("./img/background.png");

  games = new ArrayList<Game>();
  games.add(new Game());
}

void draw() {
  background(55);

  image(bg, bgX, 0, bg.width, height); // Background display
  bgX -= 20; // background velocity

  if (bgX <= -bg.width + width) {  // Infinite loop for background
    image(bg, bgX + bg.width, 0, bg.width, height);
    if (bgX <= -bg.width) {
      bgX = 0;
    }
  }

  score.display();

  for (int i = games.size() - 1; i >= 0; i--) {
    Game g = games.get(i);
    g.play(score);
    if (!g.isAlive) {
      games.remove(i);
    }
  }

  if (games.size() == 0) {

    textAlign(CENTER);
    fill(255);
    text("GAME OVER", width/2, height/2);
    text("TAP TO RESTART", width/2, height/2 + 15);

    if (mousePressed) {
      games.add(new Game(true));
    }
  }
}

void mousePressed() {
  for (int i = games.size() - 1; i >= 0; i--) {
    Game g = games.get(i);
    g.ball.speedY += - g.ball.gravity * 18;

    if (!g.start) {
      g.start = true;
    }
  }
}
