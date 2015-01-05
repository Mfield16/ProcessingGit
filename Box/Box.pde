float noiseScale = .01;
void setup() {
  size(500, 500, P3D );
}

void draw() {
  translate(width/2, height/2);
  background(90);
  noFill();
  float noiseFrame = noiseScale*frameCount;
  rotateX(noiseFrame);
  rotateZ(noiseFrame);
  rotateY(noiseFrame);
  box(50);
  
}

