class Score {

  private int score;
  private int record;

  public Score() {
    score = 0;
    record = 0;
  }

  public int getScore() {
    return score;
  }

  public int getRecord() {
    return record;
  }

  public void setScore(int score) {
    this.score = score;
  }

  public void setRecord(int record) {
    this.record = record;
  }

  public void incrementScoreBy(int point) {
    score += point;
  }

  void display() {
    textSize(28);
    textAlign(LEFT);
    fill(0);
    text("Score: " + score, 35, 50);
    text("Record: " + record, 35, 75);
    //text("Frames: " + frameRate, 35, 100); // Display frame rate in screen
  }
}
