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

  public void display() {
    textSize(15);
    textAlign(LEFT);
    fill(255);
    text("Score: " + score, 35, 25);
    text("Record: " + record, 35, 45);
    //text("Frames: " + frameRate, 35, 65); // Display frame rate in screen
  }
}
