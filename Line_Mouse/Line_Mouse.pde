void setup() {
  size(700, 700);
  background(random(255));
}

void draw() {
  stroke(random(255, 10));
  line(width/2, height/2, mouseX, mouseY);
  if (mousePressed) {
    background(90);
  }
  if (frameCount/2 < 50) {
    background(90);
  }
  println(frameCount);
}

