class Score {
  int score = 0;
  int record = 0;

  void display() {
    textSize(28);
    textAlign(LEFT);
    fill(0);
    text("Score: " + score, 35, 50);
    text("Record: " + record, 35, 75);
    text("Frames: " + frameRate, 35, 100);
  }
}
