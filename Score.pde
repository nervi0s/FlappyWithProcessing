class Score {
  int score = 0;
  int record = 0;

  void display() {
    textSize(15);
    textAlign(LEFT);
    fill(255);
    text("Score: " + score, 35, 25);
    text("Record: " + record, 35, 45);
    //text("Frames: " + frameRate, 35, 65); // Display frame rate in screen
  }
}
