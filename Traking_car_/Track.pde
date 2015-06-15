class Track {
  void draw() {
    stroke(0);
    strokeWeight(15);

    rectMode(CENTER);
    noFill();
    ellipse(0, 0, 400, 400);
    rect(0, 0, 400, 400);
    rect(0, 0, 10, 400);
    rect(0, 0, 400, 10);
  }
}
