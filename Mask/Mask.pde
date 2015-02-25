int numRows = 10, numCols = 10;
void setup() {
  size(640, 480);
}
void draw() {

  background(90);
  fill(255, 2);
  rect(0,0, width, height);
  fill(50, 200, 100);
  float ballX, ballY;
  ballX = width * noise(frameCount*.002);
  ballY = height * noise(frameCount*.004);
  ellipse(ballX, ballY, 50, 50);
  pushMatrix();
  fill(255);
  //  ellipse(width/2, height/2, 100, 100);
  float colSeperation = width/(numCols+1.0);
  float rowSeperation = height/(numRows+1.0);
  for (int row =0; row <numRows; row++) {
    translate(0, rowSeperation);
    pushMatrix();
    for (int col =0; col <numCols; col++) {
      translate(colSeperation, 0);
      ellipse(0, 0, 20, 20);
    }
    popMatrix();
  }
  popMatrix();
}

