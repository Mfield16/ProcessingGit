void setup() {
  size(500, 500);
}
void draw() {

  background(90);
  //  sphere();
  strokeWeight(5);
  ellipse(mouseX, mouseY, 50, 50);
  translate(width/2, height/2);

  ellipse(0, 0, 50, 50);
}

