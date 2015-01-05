void setup() {
  size(2400, 1200, P3D);
}
void draw() {
  stroke(random(255), random(255), random(255));
  background(90); 
  pushMatrix();
  translate(width/2, height/2);
  sphere(90);
  popMatrix();
  //  fill(random(255), random(255), random(255),random(400));
  translate(width/2+50, height/2);
  sphere(90);
}

