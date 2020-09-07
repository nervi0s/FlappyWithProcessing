PImage bg;
float bgX = 0; // background velocity

ArrayList<Game> games;
Score score = new Score();

void setup() {
  size(displayWidth, displayHeight);
  bg = loadImage("background.png");

  games = new ArrayList<Game>();
  games.add(new Game(false));
}

void draw() {
  background(0);

  imageMode(CORNER);
  image(bg, bgX, 0, bg.width, displayHeight); //  Background image display
  if ( games.size() > 0 && games.get(0).getStartStatus()) { // Move background image if a game is active
    bgX -= 4; // background velocity
  }

  if (bgX <= -bg.width + width) {  // Infinite loop for background image
    imageMode(CORNER);
    image(bg, bgX + bg.width, 0, bg.width, displayHeight);
    if (bgX <= -bg.width) {
      bgX = 0;
    }
  }

  for (int i = games.size() - 1; i >= 0; i--) {
    Game game = games.get(i);

    game.play(score);

    if (!game.isAlive()) {
      textAlign(CENTER);
      textSize(40);
      fill(0);
      text("\ud83d\udc7e GAME OVER \ud83d\udc7e", width/2, height/2);
      text("TAP HERE TO RESTART", width/2, height/2 + 45);
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
    Game game = games.get(i);

    game.ball.setSpeedYOnClic();

    if (!game.getStartStatus()) { // To "move" the game the first time that the player initialize the game (TAP TO START)
      game.setStartStatus(true);
    }

    if (!game.isAlive()) {
      if (mouseX > width/2 - 200 && mouseX < width/2 + 200) {
        if (mouseY > height/2 - 100 && mouseY < height/2 + 100) {
          score.setScore(0);
          game.resume();
          games.remove(i);
          games.add(new Game(true));
        }
      }
    }
  }
}
