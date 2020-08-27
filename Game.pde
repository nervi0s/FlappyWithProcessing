class Game {
  boolean start = false;
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

    if (!start) {

      textAlign(CENTER);
      text("TAP TO START", width/2, height/2+50);
    } else {


      ball.display();
      if (!pause)
        ball.move();

      for (int i = obstacles.size() - 1; i >= 0; i--) {
        Obstacle o = obstacles.get(i);

        o.display();
        if (!pause)
          o.toLeft();

        if (o.rect1X < width/2 && o.isUtil) {
          o.isUtil = false;
          obstacles.add(new Obstacle());
        }

        if (o.canBeRemoved) {
          obstacles.remove(i);
        }

        for (int j = o.sensors.size() - 1; j >= 0; j--) {
          CollisionSensors s = o.sensors.get(j);
          s.display();
          if (!pause)
            s.moveWithObstacle();
          s.detectDistance(ball);
          if (!s.isUtil) {
            score.score++;
            o.sensors.remove(j);
          }
          if (s.isCollision) {
            //frameRate(0);
            pause = true;
            isAlive = false;
            score.record = score.score > score.record ? score.score : score.record ;
            if (mousePressed)
              score.score = 0;
          }
        }
      }


      println(obstacles.size());
    }
  }
}
