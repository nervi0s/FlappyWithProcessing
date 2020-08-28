PImage bg;
float bgX = 0;

ArrayList<Game> games;
Score score = new Score();

void setup() {
  size(displayWidth, displayHeight);
  bg = loadImage("background.png");

  games = new ArrayList<Game>();
  games.add(new Game());
}

void draw() {
  background(0);

  imageMode(CORNER);
  image(bg, bgX, 0, bg.width, displayHeight); // Background display
  if ( games.size()>0 && games.get(0).start && !games.get(0).pause) { //Move bg if a game is active
    bgX -= 4; // background velocity
  }

  if (bgX <= -bg.width + width) {  // Infinite loop for background
    imageMode(CORNER);
    image(bg, bgX + bg.width, 0, bg.width, displayHeight);
    if (bgX <= -bg.width) {
      bgX = 0;
    }
  }

  for (int i = games.size() - 1; i >= 0; i--) {
    Game g = games.get(i);

    g.play(score);

    if (!g.isAlive) {
      textAlign(CENTER);
      textSize(40);
      fill(0);
      text("\ud83d\udc7e GAME OVER \ud83d\udc7e", width/2, height/2);
      text("TAP HERE TO RESTART", width/2, height/2 + 45);
      if (mousePressed) {
        if (mouseX > width/2 - 200 && mouseX < width/2 + 200) {
          if (mouseY > height/2 -100 && mouseY < height/2 +100) {
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
      if (mouseX > width/2 - 200 && mouseX < width/2 + 200) {
        if (mouseY > height/2 -100 && mouseY < height/2 +100) {
          games.add(new Game(true));
        }
      }
    }
  }

  score.display();

  if (games.size() > 0) {
    println(games.size() + " " + games.get(0).obstacles.size() + " " + games.get(0).obstacles.get(0).sensors.size() + " " + frameRate); //Checking instances of sensors anda obstacles
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
