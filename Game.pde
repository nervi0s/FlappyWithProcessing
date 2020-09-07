class Game {

  private boolean start;
  private boolean isAlive;
  private Bird ball = new Bird();
  private ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();

  public Game(boolean startStatus) {
    start = startStatus;
    isAlive = true;
    obstacles.add(new Obstacle());
  }

  public boolean getStartStatus() {
    return this.start;
  }

  public boolean isAlive() {
    return this.isAlive;
  }

  public void setStartStatus(boolean status) {
    this.start = status;
  }

  public void pause() { // Pause the main loop draw() 
    noLoop();
  }

  public void resume() { // Resume the main loop draw() 
    loop();
  }

  public void play(Score score) {

    ball.display();

    if (!start) {
      textAlign(CENTER);
      textSize(14);
      fill(255);
      text("TAP TO START", width/2, height/2 + ball.diameter);
    } else {

      ball.move();

      for (int i = obstacles.size() - 1; i >= 0; i--) {
        Obstacle o = obstacles.get(i);

        o.display();

        o.toLeft();

        if (o.getXPosition() < width * 0.60 && o.getIsUtil()) {
          o.setUtil(false);
          obstacles.add(new Obstacle());
        }
        if (o.getCanBeRemoved()) {
          obstacles.remove(i);
        }
        if (o.checkBallPassed(ball) && !o.getBallPassedStatus()) {
          score.incrementScoreBy(1);
          o.setBallPassedStatus(true);
        }


        for (int j = o.sensors.size() - 1; j >= 0; j--) {
          CollisionSensor s = o.sensors.get(j);
          s.display();

          s.moveWithObstacle();

          s.detectDistance(ball);

          if (!s.getIsUtil()) {
            o.sensors.remove(j);
          }

          if (s.getIsCollision()) {
            score.setRecord(score.getScore() > score.getRecord() ? score.getScore() : score.getRecord());
            isAlive = false;
            pause();
          }
        }
      }
    }
  }
}
