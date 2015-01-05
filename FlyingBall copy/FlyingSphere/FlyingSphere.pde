ArrayList<Ball>balls;
int numberFramesPerBall = 20;

void setup() {
  balls = new ArrayList<Ball>();
  size(500, 500, P3D);
}

void draw() {
  background(120);
  if (frameCount % numberFramesPerBall == 0) {
    balls.add(new Ball());
  }
  for (Ball  ball: balls) {
    ball.draw();
  }
}

