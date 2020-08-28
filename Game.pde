class Game {
  boolean start = false;
  boolean pause = false;
  boolean isAlive;

  Bird ball = new Bird();
  ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

  Game() {
    isAlive = true;
    obstacles.add(new Obstacle());
  }

  Game(boolean retry) {
    start = retry;
    isAlive = true;
    obstacles.add(new Obstacle());
  }

  void play(Score score) {

    ball.display();

    if (!start) {
      textAlign(CENTER);
      textSize(42);
      fill(0);
      text("TAP TO START", width/2, height/2 + ball.diameter);
    } else {

      if (!pause) {
        ball.move();
      }

      for (int i = obstacles.size() - 1; i >= 0; i--) {
        Obstacle o = obstacles.get(i);

        o.display();

        if (!pause) {
          o.toLeft();

          if (o.rectX < width * 0.60 && o.isUtil) {
            o.isUtil = false;
            obstacles.add(new Obstacle());
          }
          if (o.canBeRemoved) {
            obstacles.remove(i);
          }

          if (o.checkBallPassed(ball) && !o.ballPassed) {
            score.score++;
            o.ballPassed = true;
          }
        }


        for (int j = o.sensors.size() - 1; j >= 0; j--) {
          CollisionSensors s = o.sensors.get(j);
          //s.display();

          if (!pause) {
            s.moveWithObstacle();
          }

          s.detectDistance(ball);

          if (!s.isUtil) {
            o.sensors.remove(j);
          }

          if (s.isCollision) {
            pause = true;
            isAlive = false;
            score.record = score.score > score.record ? score.score : score.record ;
            if (mousePressed && mouseX > width/2 - 200 && mouseX < width/2 + 200) {
              if (mouseY > height/2 - 100 && mouseY < height/2 + 100) {
                score.score = 0;
              }
            }
          }
        }
      }
    }
  }
}
