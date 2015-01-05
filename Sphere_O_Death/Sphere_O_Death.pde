float noiseScale = .04;
int numFrames = 157;
void setup() {
  size(500, 500, P3D);
  background(90);
}

void draw() {
  if (frameCount > numFrames) return;
  float noiseFrame = noiseScale*frameCount;
  translate(width/2, height/2);
  rotateX(noiseFrame);
  rotateZ(noiseFrame);
  rotateY(noiseFrame);
  stroke(100, 100, 100);
  sphere(60);
  saveFrame("Sphere-######.png");
}


