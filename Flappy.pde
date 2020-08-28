PImage bg;
float bgX = 0;

ArrayList<Game> games;
Score score = new Score();

void setup() {
  size(700, 500);
  bg = loadImage("./img/background.png");

  games = new ArrayList<Game>();
  games.add(new Game());
}

void draw() {
  background(55);

  imageMode(CORNER);
  image(bg, bgX, 0, bg.width, height); // Background display
  if ( games.size()>0 && games.get(0).start && !games.get(0).pause) { //Move bg if a game is active
    bgX -= 3; // background velocity
  }

  if (bgX <= -bg.width + width) {  // Infinite loop for background
    imageMode(CORNER);
    image(bg, bgX + bg.width, 0, bg.width, height);
    if (bgX <= -bg.width) {
      bgX = 0;
    }
  }

  for (int i = games.size() - 1; i >= 0; i--) {
    Game g = games.get(i);

    g.play(score);

    if (!g.isAlive) {
      textAlign(CENTER);
      textSize(15);
      fill(255);
      text("GAME OVER", width/2, height/2);
      text("TAP TO RESTART", width/2, height/2 + 20);
      if (mousePressed) {
        if (mouseX > width/2 - 100 && mouseX < width/2 + 100) {
          if (mouseY > height/2 - 50 && mouseY < height/2 + 50) {
            g.pause = false;
          }
        }
      }

      if (!g.pause) {
        games.remove(i);
      }
    }
  }

  if (games.size() == 0) {

    if (mousePressed) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100) {
        if (mouseY > height/2 - 50 && mouseY < height/2 + 50) {
          games.add(new Game(true));
        }
      }
    }
  }

  score.display();

  if (games.size() > 0) {
    println(games.size() + " " + games.get(0).obstacles.size() + " " + games.get(0).obstacles.get(0).sensors.size() + " " + frameRate); //Checking instances of sensors and obstacles
  } else {
    println(games.size() + " " + frameRate);
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
