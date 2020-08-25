class Score {
  int score = 0;
  int record = 0;

  void display() {
    textSize(15);
    textAlign(LEFT);
    text("Score: " + score, 35, 25);
    text("Record: " + record, 35, 50);
  }
}
