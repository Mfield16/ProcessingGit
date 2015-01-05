ArrayList<Ball>balls;
int numberFramesPerBall = 10;

void setup() {
  balls = new ArrayList<Ball>();
  size(500, 500);
}

void draw() {
  background(90);
  if (frameCount % numberFramesPerBall == 0) {
    balls.add(new Ball());
  }
  for (Ball  ball: balls) {
    ball.draw();
  }
}

